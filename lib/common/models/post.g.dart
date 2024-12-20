// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      pid: json['pid'] as String,
      status: $enumDecode(_$PostStatusEnumMap, json['status']),
      createdAt: Utils.timestampFromJson(json['createdAt'] as int),
      updatedAt: Utils.timestampFromJson(json['updatedAt'] as int),
      sourceCreatedAt:
          Utils.timestampFromJsonNullable(json['sourceCreatedAt'] as int?),
      eid: json['eid'] as String?,
      sid: json['sid'] as String?,
      xid: json['xid'] as String?,
      plid: json['plid'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      poster: json['poster'] as String?,
      sids:
          (json['sids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      stids:
          (json['stids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      url: json['url'] as String?,
      photo: json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replies: json['replies'] as int?,
      reposts: json['reposts'] as int?,
      likes: json['likes'] as int?,
      bookmarks: json['bookmarks'] as int?,
      views: json['views'] as int?,
      bias: json['bias'] == null
          ? null
          : PoliticalPosition.fromJson(json['bias']),
      confidence: json['confidence'] == null
          ? null
          : Confidence.fromJson(json['confidence']),
      messageCount: json['messageCount'] as int?,
      userBias: json['userBias'] == null
          ? null
          : PoliticalPosition.fromJson(json['userBias']),
      aiBias: json['aiBias'] == null
          ? null
          : PoliticalPosition.fromJson(json['aiBias']),
      debateBias: json['debateBias'] == null
          ? null
          : PoliticalPosition.fromJson(json['debateBias']),
      userConfidence: json['userConfidence'] == null
          ? null
          : Confidence.fromJson(json['userConfidence']),
      aiConfidence: json['aiConfidence'] == null
          ? null
          : Confidence.fromJson(json['aiConfidence']),
      voteCountBias: json['voteCountBias'] as int? ?? 0,
      voteCountConfidence: json['voteCountConfidence'] as int? ?? 0,
      debateCountBias: json['debateCountBias'] as int? ?? 0,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'pid': instance.pid,
      'sid': instance.sid,
      'sids': instance.sids,
      'stids': instance.stids,
      'eid': instance.eid,
      'xid': instance.xid,
      'plid': instance.plid,
      'poster': instance.poster,
      'status': _$PostStatusEnumMap[instance.status]!,
      'title': instance.title,
      'body': instance.body,
      'photo': instance.photo?.toJson(),
      'video': instance.video?.toJson(),
      'url': instance.url,
      'locations': instance.locations,
      'replies': instance.replies,
      'reposts': instance.reposts,
      'likes': instance.likes,
      'bookmarks': instance.bookmarks,
      'views': instance.views,
      'confidence': instance.confidence?.toJson(),
      'bias': instance.bias?.toJson(),
      'userBias': instance.userBias?.toJson(),
      'aiBias': instance.aiBias?.toJson(),
      'debateBias': instance.debateBias?.toJson(),
      'userConfidence': instance.userConfidence?.toJson(),
      'aiConfidence': instance.aiConfidence?.toJson(),
      'voteCountBias': instance.voteCountBias,
      'voteCountConfidence': instance.voteCountConfidence,
      'debateCountBias': instance.debateCountBias,
      'messageCount': instance.messageCount,
      'createdAt': Utils.timestampToJson(instance.createdAt),
      'updatedAt': Utils.timestampToJson(instance.updatedAt),
      'sourceCreatedAt':
          Utils.timestampToJsonNullable(instance.sourceCreatedAt),
    };

const _$PostStatusEnumMap = {
  PostStatus.scraping: 'scraping',
  PostStatus.draft: 'draft',
  PostStatus.published: 'published',
  PostStatus.findingStories: 'findingStories',
  PostStatus.foundStories: 'foundStories',
  PostStatus.findingStatements: 'findingStatements',
  PostStatus.foundStatements: 'foundStatements',
  PostStatus.found: 'found',
  PostStatus.unsupported: 'unsupported',
};
