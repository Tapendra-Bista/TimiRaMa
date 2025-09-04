import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Custom cache manager for optimized image caching
class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._internal();
  factory ImageCacheManager() => _instance;
  ImageCacheManager._internal();

  /// Cache manager for story images with optimized settings
  static final CacheManager storyCacheManager = CacheManager(
    Config(
      'story_cache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
      repo: JsonCacheInfoRepository(databaseName: 'story_cache'),
      fileService: HttpFileService(),
    ),
  );

  /// Cache manager for profile images with longer retention
  static final CacheManager profileCacheManager = CacheManager(
    Config(
      'profile_cache',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 500,
      repo: JsonCacheInfoRepository(databaseName: 'profile_cache'),
      fileService: HttpFileService(),
    ),
  );

  /// Cache manager for chat images with moderate retention
  static final CacheManager chatCacheManager = CacheManager(
    Config(
      'chat_cache',
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: 'chat_cache'),
      fileService: HttpFileService(),
    ),
  );

  /// Cache manager for reel thumbnails
  static final CacheManager reelCacheManager = CacheManager(
    Config(
      'reel_cache',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 150,
      repo: JsonCacheInfoRepository(databaseName: 'reel_cache'),
      fileService: HttpFileService(),
    ),
  );

  /// Preload images for better performance
  static Future<void> preloadImage(String imageUrl, CacheManager cacheManager) async {
    try {
      await cacheManager.getSingleFile(imageUrl);
    } catch (e) {
      // Silently handle preload failures
      print('Failed to preload image: $imageUrl');
    }
  }

  /// Preload multiple images in batch
  static Future<void> preloadImages(List<String> imageUrls, CacheManager cacheManager) async {
    final futures = imageUrls.map((url) => preloadImage(url, cacheManager));
    await Future.wait(futures);
  }

  /// Clear specific cache
  static Future<void> clearCache(CacheManager cacheManager) async {
    await cacheManager.emptyCache();
  }

  /// Clear all caches
  static Future<void> clearAllCaches() async {
    await Future.wait([
      storyCacheManager.emptyCache(),
      profileCacheManager.emptyCache(),
      chatCacheManager.emptyCache(),
      reelCacheManager.emptyCache(),
    ]);
  }

  /// Get cache size information
  static Future<Map<String, int>> getCacheSizes() async {
    try {
      final futures = await Future.wait([
        storyCacheManager.getFileStream('').length,
        profileCacheManager.getFileStream('').length,
        chatCacheManager.getFileStream('').length,
        reelCacheManager.getFileStream('').length,
      ]);

      return {
        'story_cache': futures[0],
        'profile_cache': futures[1],
        'chat_cache': futures[2],
        'reel_cache': futures[3],
      };
    } catch (e) {
      // Return empty stats if unable to get cache sizes
      return {
        'story_cache': 0,
        'profile_cache': 0,
        'chat_cache': 0,
        'reel_cache': 0,
      };
    }
  }

  /// Clean up old cache entries
  static Future<void> cleanupOldEntries() async {
    // Use the cache managers' built-in cleanup
    await Future.wait([
      storyCacheManager.emptyCache(),
      profileCacheManager.emptyCache(),
      chatCacheManager.emptyCache(),
      reelCacheManager.emptyCache(),
    ]);
  }
}

/// Extension for easy CachedNetworkImage configuration
extension CachedNetworkImageExtension on CachedNetworkImage {
  /// Create optimized CachedNetworkImage for stories
  static CachedNetworkImage story({
    required String imageUrl,
    BoxFit? fit = BoxFit.cover,
    int? memCacheWidth = 400,
    int? memCacheHeight = 600,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      maxWidthDiskCache: 800,
      maxHeightDiskCache: 1200,
      cacheManager: ImageCacheManager.storyCacheManager,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      placeholder: placeholder != null ? (context, url) => placeholder : null,
      errorWidget: errorWidget != null ? (context, url, error) => errorWidget : null,
    );
  }

  /// Create optimized CachedNetworkImage for profiles
  static CachedNetworkImage profile({
    required String imageUrl,
    BoxFit? fit = BoxFit.cover,
    int? memCacheWidth = 200,
    int? memCacheHeight = 200,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      maxWidthDiskCache: 400,
      maxHeightDiskCache: 400,
      cacheManager: ImageCacheManager.profileCacheManager,
      fadeInDuration: const Duration(milliseconds: 150),
      fadeOutDuration: const Duration(milliseconds: 150),
      placeholder: placeholder != null ? (context, url) => placeholder : null,
      errorWidget: errorWidget != null ? (context, url, error) => errorWidget : null,
    );
  }

  /// Create optimized CachedNetworkImage for chat
  static CachedNetworkImage chat({
    required String imageUrl,
    BoxFit? fit = BoxFit.cover,
    int? memCacheWidth = 300,
    int? memCacheHeight = 300,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      maxWidthDiskCache: 600,
      maxHeightDiskCache: 600,
      cacheManager: ImageCacheManager.chatCacheManager,
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      placeholder: placeholder != null ? (context, url) => placeholder : null,
      errorWidget: errorWidget != null ? (context, url, error) => errorWidget : null,
    );
  }
}