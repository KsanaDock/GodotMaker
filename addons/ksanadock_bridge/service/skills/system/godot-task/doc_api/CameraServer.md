## CameraServer <- Object

**Props:**
- monitoring_feeds: bool = false

**Methods:**
- add_feed(feed: CameraFeed)
- feeds() -> CameraFeed[]
- get_feed(index: int) -> CameraFeed
- get_feed_count() -> int
- remove_feed(feed: CameraFeed)

**Signals:**
- camera_feed_added(id: int)
- camera_feed_removed(id: int)
- camera_feeds_updated
