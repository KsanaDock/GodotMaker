@tool
class_name KPalette
extends RefCounted
## KsanaDock 全局调色板常量

# ── 背景 ──
const BG_MAIN := Color("#0a0a0a")
const BG_CARD := Color("#111111")
const BG_INPUT := Color("#1c1c1c")
const BG_HOVER := Color("#1a1a1a")

# ── 强调色 ──
const EMERALD := Color("#10b981")
const EMERALD_DIM := Color("#065f46")
const SKY := Color("#38bdf8")
const SKY_DIM := Color("#0c4a6e")

# ── 文字 ──
const TEXT_PRIMARY := Color("#ffffff")
const TEXT_SECONDARY := Color("#a1a1aa")
const TEXT_DIM := Color("#52525b")
const TEXT_LINK := Color("#34d399")

# ── 边框 ──
const BORDER := Color(1, 1, 1, 0.08)
const BORDER_FOCUS := Color("#10b981", 0.5)
const BORDER_ERROR := Color("#ef4444", 0.5)

# ── 消息气泡 ──
const BUBBLE_AI := Color("#111111")
const BUBBLE_AI_BORDER := Color("#10b981", 0.2)
const BUBBLE_USER := Color("#38bdf8", 0.08)
const BUBBLE_USER_BORDER := Color("#38bdf8", 0.2)

# ── 语义色 ──
const SUCCESS := Color("#22c55e")
const WARNING := Color("#f59e0b")
const ERROR := Color("#ef4444")

# ── 圆角 ──
const RADIUS_SM := 6
const RADIUS_MD := 10
const RADIUS_LG := 16

# ── 间距 ──
const PAD_XS := 4
const PAD_SM := 8
const PAD_MD := 12
const PAD_LG := 16
const PAD_XL := 24


## 创建纯色圆角 StyleBoxFlat
static func flat_box(bg: Color, radius: int = RADIUS_MD, border_color: Color = Color.TRANSPARENT, border_width: int = 0) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = bg
	sb.corner_radius_top_left = radius
	sb.corner_radius_top_right = radius
	sb.corner_radius_bottom_left = radius
	sb.corner_radius_bottom_right = radius
	if border_width > 0:
		sb.border_color = border_color
		sb.border_width_top = border_width
		sb.border_width_bottom = border_width
		sb.border_width_left = border_width
		sb.border_width_right = border_width
	sb.content_margin_top = PAD_SM
	sb.content_margin_bottom = PAD_SM
	sb.content_margin_left = PAD_MD
	sb.content_margin_right = PAD_MD
	return sb


## 创建输入框样式
static func input_style_normal() -> StyleBoxFlat:
	return flat_box(BG_INPUT, RADIUS_SM)


## 输入框获得焦点时的样式（通过信号程序化切换 normal 来实现）
static func input_style_focused() -> StyleBoxFlat:
	return flat_box(BG_INPUT, RADIUS_SM, Color.WHITE, 2)


## 创建主按钮样式 (渐变用纯色近似)
static func btn_primary() -> StyleBoxFlat:
	return flat_box(EMERALD, RADIUS_SM)


static func btn_primary_hover() -> StyleBoxFlat:
	return flat_box(EMERALD.lightened(0.15), RADIUS_SM)


static func btn_primary_pressed() -> StyleBoxFlat:
	return flat_box(EMERALD.darkened(0.1), RADIUS_SM)


## 创建次要按钮样式
static func btn_secondary() -> StyleBoxFlat:
	return flat_box(BG_CARD, RADIUS_SM)


static func btn_secondary_hover() -> StyleBoxFlat:
	return flat_box(BG_HOVER, RADIUS_SM)
