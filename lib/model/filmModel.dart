class FilmModel {
  final Pagination? pagination;
  final List<Data>? data;

  FilmModel({
    this.pagination,
    this.data,
  });

  FilmModel.fromJson(Map<String, dynamic> json)
      : pagination = (json['pagination'] as Map<String,dynamic>?) != null ? Pagination.fromJson(json['pagination'] as Map<String,dynamic>) : null,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'pagination' : pagination?.toJson(),
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Pagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final int? currentPage;
  final Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : lastVisiblePage = json['last_visible_page'] as int?,
        hasNextPage = json['has_next_page'] as bool?,
        currentPage = json['current_page'] as int?,
        items = (json['items'] as Map<String,dynamic>?) != null ? Items.fromJson(json['items'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'last_visible_page' : lastVisiblePage,
    'has_next_page' : hasNextPage,
    'current_page' : currentPage,
    'items' : items?.toJson()
  };
}

class Items {
  final int? count;
  final int? total;
  final int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  Items.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        total = json['total'] as int?,
        perPage = json['per_page'] as int?;

  Map<String, dynamic> toJson() => {
    'count' : count,
    'total' : total,
    'per_page' : perPage
  };
}

class Data {
  final int? malId;
  final String? url;
  final Images? images;
  final Trailer? trailer;
  final bool? approved;
  final List<Titles>? titles;
  final String? title;
  final dynamic titleEnglish;
  final String? titleJapanese;
  final List<String>? titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final dynamic score;
  final dynamic scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final dynamic background;
  final dynamic season;
  final dynamic year;
  final Broadcast? broadcast;
  final List<dynamic>? producers;
  final List<dynamic>? licensors;
  final List<dynamic>? studios;
  final List<Genres>? genres;
  final List<dynamic>? explicitGenres;
  final List<dynamic>? themes;
  final List<dynamic>? demographics;

  Data({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  Data.fromJson(Map<String, dynamic> json)
      : malId = json['mal_id'] as int?,
        url = json['url'] as String?,
        images = (json['images'] as Map<String,dynamic>?) != null ? Images.fromJson(json['images'] as Map<String,dynamic>) : null,
        trailer = (json['trailer'] as Map<String,dynamic>?) != null ? Trailer.fromJson(json['trailer'] as Map<String,dynamic>) : null,
        approved = json['approved'] as bool?,
        titles = (json['titles'] as List?)?.map((dynamic e) => Titles.fromJson(e as Map<String,dynamic>)).toList(),
        title = json['title'] as String?,
        titleEnglish = json['title_english'],
        titleJapanese = json['title_japanese'] as String?,
        titleSynonyms = (json['title_synonyms'] as List?)?.map((dynamic e) => e as String).toList(),
        type = json['type'] as String?,
        source = json['source'] as String?,
        episodes = json['episodes'] as int?,
        status = json['status'] as String?,
        airing = json['airing'] as bool?,
        aired = (json['aired'] as Map<String,dynamic>?) != null ? Aired.fromJson(json['aired'] as Map<String,dynamic>) : null,
        duration = json['duration'] as String?,
        rating = json['rating'] as String?,
        score = json['score'],
        scoredBy = json['scored_by'],
        rank = json['rank'] as int?,
        popularity = json['popularity'] as int?,
        members = json['members'] as int?,
        favorites = json['favorites'] as int?,
        synopsis = json['synopsis'] as String?,
        background = json['background'],
        season = json['season'],
        year = json['year'],
        broadcast = (json['broadcast'] as Map<String,dynamic>?) != null ? Broadcast.fromJson(json['broadcast'] as Map<String,dynamic>) : null,
        producers = json['producers'] as List?,
        licensors = json['licensors'] as List?,
        studios = json['studios'] as List?,
        genres = (json['genres'] as List?)?.map((dynamic e) => Genres.fromJson(e as Map<String,dynamic>)).toList(),
        explicitGenres = json['explicit_genres'] as List?,
        themes = json['themes'] as List?,
        demographics = json['demographics'] as List?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'url' : url,
    'images' : images?.toJson(),
    'trailer' : trailer?.toJson(),
    'approved' : approved,
    'titles' : titles?.map((e) => e.toJson()).toList(),
    'title' : title,
    'title_english' : titleEnglish,
    'title_japanese' : titleJapanese,
    'title_synonyms' : titleSynonyms,
    'type' : type,
    'source' : source,
    'episodes' : episodes,
    'status' : status,
    'airing' : airing,
    'aired' : aired?.toJson(),
    'duration' : duration,
    'rating' : rating,
    'score' : score,
    'scored_by' : scoredBy,
    'rank' : rank,
    'popularity' : popularity,
    'members' : members,
    'favorites' : favorites,
    'synopsis' : synopsis,
    'background' : background,
    'season' : season,
    'year' : year,
    'broadcast' : broadcast?.toJson(),
    'producers' : producers,
    'licensors' : licensors,
    'studios' : studios,
    'genres' : genres?.map((e) => e.toJson()).toList(),
    'explicit_genres' : explicitGenres,
    'themes' : themes,
    'demographics' : demographics
  };
}

class Images {
  final Jpg? jpg;
  final Webp? webp;

  Images({
    this.jpg,
    this.webp,
  });

  Images.fromJson(Map<String, dynamic> json)
      : jpg = (json['jpg'] as Map<String,dynamic>?) != null ? Jpg.fromJson(json['jpg'] as Map<String,dynamic>) : null,
        webp = (json['webp'] as Map<String,dynamic>?) != null ? Webp.fromJson(json['webp'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'jpg' : jpg?.toJson(),
    'webp' : webp?.toJson()
  };
}

class Jpg {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Jpg.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'] as String?,
        smallImageUrl = json['small_image_url'] as String?,
        largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class Webp {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Webp({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Webp.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'] as String?,
        smallImageUrl = json['small_image_url'] as String?,
        largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class Trailer {
  final dynamic youtubeId;
  final dynamic url;
  final dynamic embedUrl;
  final Images? images;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.images,
  });

  Trailer.fromJson(Map<String, dynamic> json)
      : youtubeId = json['youtube_id'],
        url = json['url'],
        embedUrl = json['embed_url'],
        images = (json['images'] as Map<String,dynamic>?) != null ? Images.fromJson(json['images'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'youtube_id' : youtubeId,
    'url' : url,
    'embed_url' : embedUrl,
    'images' : images?.toJson()
  };
}

// ... (other classes remain unchanged)

class TopLevelImages {
  final dynamic imageUrl;
  final dynamic smallImageUrl;
  final dynamic mediumImageUrl;
  final dynamic largeImageUrl;
  final dynamic maximumImageUrl;

  TopLevelImages({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  TopLevelImages.fromJson(Map<String, dynamic> json)
      : imageUrl = json['image_url'],
        smallImageUrl = json['small_image_url'],
        mediumImageUrl = json['medium_image_url'],
        largeImageUrl = json['large_image_url'],
        maximumImageUrl = json['maximum_image_url'];

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'medium_image_url' : mediumImageUrl,
    'large_image_url' : largeImageUrl,
    'maximum_image_url' : maximumImageUrl
  };
}

// ... (rest of the classes remain unchanged)


class Titles {
  final String? type;
  final String? title;

  Titles({
    this.type,
    this.title,
  });

  Titles.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'title' : title
  };
}

class Aired {
  final String? from;
  final dynamic to;
  final Prop? prop;
  final String? string;

  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  Aired.fromJson(Map<String, dynamic> json)
      : from = json['from'] as String?,
        to = json['to'],
        prop = (json['prop'] as Map<String,dynamic>?) != null ? Prop.fromJson(json['prop'] as Map<String,dynamic>) : null,
        string = json['string'] as String?;

  Map<String, dynamic> toJson() => {
    'from' : from,
    'to' : to,
    'prop' : prop?.toJson(),
    'string' : string
  };
}

class Prop {
  final From? from;
  final To? to;

  Prop({
    this.from,
    this.to,
  });

  Prop.fromJson(Map<String, dynamic> json)
      : from = (json['from'] as Map<String,dynamic>?) != null ? From.fromJson(json['from'] as Map<String,dynamic>) : null,
        to = (json['to'] as Map<String,dynamic>?) != null ? To.fromJson(json['to'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'from' : from?.toJson(),
    'to' : to?.toJson()
  };
}

class From {
  final int? day;
  final int? month;
  final int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  From.fromJson(Map<String, dynamic> json)
      : day = json['day'] as int?,
        month = json['month'] as int?,
        year = json['year'] as int?;

  Map<String, dynamic> toJson() => {
    'day' : day,
    'month' : month,
    'year' : year
  };
}

class To {
  final dynamic day;
  final dynamic month;
  final dynamic year;

  To({
    this.day,
    this.month,
    this.year,
  });

  To.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        month = json['month'],
        year = json['year'];

  Map<String, dynamic> toJson() => {
    'day' : day,
    'month' : month,
    'year' : year
  };
}

class Broadcast {
  final dynamic day;
  final dynamic time;
  final dynamic timezone;
  final dynamic string;

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  Broadcast.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        time = json['time'],
        timezone = json['timezone'],
        string = json['string'];

  Map<String, dynamic> toJson() => {
    'day' : day,
    'time' : time,
    'timezone' : timezone,
    'string' : string
  };
}

class Genres {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Genres({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Genres.fromJson(Map<String, dynamic> json)
      : malId = json['mal_id'] as int?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}