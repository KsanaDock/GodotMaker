## Color

**Props:**
- a: float = 1.0
- a8: int = 255
- b: float = 0.0
- b8: int = 0
- g: float = 0.0
- g8: int = 0
- h: float = 0.0
- ok_hsl_h: float = 0.0
- ok_hsl_l: float = 0.0
- ok_hsl_s: float = 0.0
- r: float = 0.0
- r8: int = 0
- s: float = 0.0
- v: float = 0.0

**Ctors:**
- Color()
- Color(from: Color, alpha: float)
- Color(from: Color)
- Color(code: String)
- Color(code: String, alpha: float)
- Color(r: float, g: float, b: float)
- Color(r: float, g: float, b: float, a: float)

**Methods:**
- blend(over: Color) -> Color
- clamp(min: Color = Color(0, 0, 0, 0), max: Color = Color(1, 1, 1, 1)) -> Color
- darkened(amount: float) -> Color
- from_hsv(h: float, s: float, v: float, alpha: float = 1.0) -> Color
- from_ok_hsl(h: float, s: float, l: float, alpha: float = 1.0) -> Color
- from_rgba8(r8: int, g8: int, b8: int, a8: int = 255) -> Color
- from_rgbe9995(rgbe: int) -> Color
- from_string(str: String, default: Color) -> Color
- get_luminance() -> float
- hex(hex: int) -> Color
- hex64(hex: int) -> Color
- html(rgba: String) -> Color
- html_is_valid(color: String) -> bool
- inverted() -> Color
- is_equal_approx(to: Color) -> bool
- lerp(to: Color, weight: float) -> Color
- lightened(amount: float) -> Color
- linear_to_srgb() -> Color
- srgb_to_linear() -> Color
- to_abgr32() -> int
- to_abgr64() -> int
- to_argb32() -> int
- to_argb64() -> int
- to_html(with_alpha: bool = true) -> String
- to_rgba32() -> int
- to_rgba64() -> int

**Operators:**
- operator !=
- operator *
- operator *
- operator *
- operator +
- operator -
- operator /
- operator /
- operator /
- operator ==
- operator []
- operator unary+
- operator unary-
