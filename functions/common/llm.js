const {defineSecret} = require("firebase-functions/params");
const {OpenAI} = require("openai");
const functions = require("firebase-functions");

const _openApiKey = defineSecret("OPENAI_API_KEY");

// need to add secret to functions.js
const OPENAI_API_KEY = function() {
  return _openApiKey.value();
};


/**
 * Generates completions for the given prompt
 * @param {string} prompt
 * @return {Promise<string>} completion response
 */
const generateCompletions = async function(prompt) {
  const completion = await new OpenAI(_openApiKey.value(),
  ).chat.completions.create({
    messages: [
      {
        role: "system",
        content: `You are a machine that only returns and replies with valid,
              iterable RFC8259 compliant JSON in your responses 
              with no leading or trailing characters`,
      },
      {role: "user", content: prompt},
    ],
    temperature: 0.0,
    // gpt-4-1106-preview for 128k token (50 page) context window
    model: "gpt-4-1106-preview",
    response_format: {"type": "json_object"},
  });
  try {
    const generation = JSON.parse(completion.choices[0].message.content);
    if (generation == null) {
      functions.logger.error(`Invalid generation: ${generation}`);
      return null;
    }
    return generation;
  } catch (e) {
    functions.logger.error(`Invalid decision: ${e}`);
    functions.logger.error(completion);
    return null;
  }
};


/**
 * Generates the vector embeddings for the given texts
 * @param {Array<string>} texts
 * @return {Promise<Array<number>>} vector response
 */
const generateEmbeddings = async function(texts) {
  const textEmbeddingResponse = await new OpenAI(_openApiKey.value())
      .embeddings.create({
        model: "text-embedding-3-small",
        input: texts,
      });
  if (textEmbeddingResponse?.data?.[0]?.embedding === undefined) {
    functions.logger.error("Error: no data in response");
  }
  const vector = textEmbeddingResponse.data[0].embedding;
  if (textEmbeddingResponse.data.length > 1) {
    functions.logger.warn("Multiple embeddings available");
  }

  return vector;
};


module.exports = {
  generateCompletions,
  generateEmbeddings,
  OPENAI_API_KEY,
};
