BACKGROUND_COLOR = "#151515"
NORMAL_LINE = "#0d61ac"
INSERT_LINE = "#437019"
VISUAL_LINE = "#870000"
NORMAL_FILE = "#0d61ac"
NORMAL_FONT = "#d8dee9"
CURSOR = "#b0d0f0"
COMMENT = "#888888"
TAB_UNFOCUSED = "#afafaf"
TAB_NUMBER = "#5faf5f"
LIGHT_GRAY = "#262626"
IDENTIFIER = "#c6b6ee"

c = c
config = config

# backgrounds
c.colors.statusbar.normal.bg = BACKGROUND_COLOR
c.colors.statusbar.command.bg = BACKGROUND_COLOR
c.colors.statusbar.insert.bg = INSERT_LINE
c.colors.statusbar.private.bg = COMMENT
c.colors.statusbar.command.private.bg = LIGHT_GRAY

c.colors.tabs.even.bg = TAB_UNFOCUSED
c.colors.tabs.odd.bg = TAB_UNFOCUSED
c.colors.tabs.pinned.even.bg = TAB_UNFOCUSED
c.colors.tabs.pinned.odd.bg = TAB_UNFOCUSED
c.colors.tabs.bar.bg = BACKGROUND_COLOR

c.colors.tabs.selected.even.bg = 'white'
c.colors.tabs.selected.odd.bg = 'white'
c.colors.tabs.pinned.selected.even.bg = 'white'
c.colors.tabs.pinned.selected.odd.bg = 'white'

c.colors.messages.info.bg = BACKGROUND_COLOR
c.colors.messages.error.bg = VISUAL_LINE

c.colors.hints.bg = CURSOR

# font color
c.colors.hints.fg = LIGHT_GRAY
c.colors.hints.match.fg = 'white'
c.colors.tabs.even.fg = BACKGROUND_COLOR
c.colors.tabs.odd.fg = BACKGROUND_COLOR
c.colors.tabs.selected.even.fg = BACKGROUND_COLOR
c.colors.tabs.selected.odd.fg = BACKGROUND_COLOR
c.colors.tabs.pinned.even.fg = TAB_NUMBER
c.colors.tabs.pinned.odd.fg = TAB_NUMBER
c.colors.tabs.pinned.selected.even.fg = TAB_NUMBER
c.colors.tabs.pinned.selected.odd.fg = TAB_NUMBER
c.colors.statusbar.normal.fg = LIGHT_GRAY
c.colors.statusbar.command.fg = COMMENT
c.colors.statusbar.insert.fg = 'white'
c.colors.statusbar.private.fg = COMMENT
c.colors.messages.info.fg = VISUAL_LINE
c.colors.messages.error.fg = 'white'
c.colors.statusbar.url.error.fg = 'white'
c.colors.statusbar.url.fg = NORMAL_FILE
c.colors.statusbar.url.hover.fg = IDENTIFIER
c.colors.statusbar.url.success.http.fg = NORMAL_FILE
c.colors.statusbar.url.success.https.fg = NORMAL_FILE
c.colors.statusbar.url.warn.fg = COMMENT

# fonts
c.fonts.default_family = ['Terminus']
c.fonts.default_size = '13pt'
c.fonts.tabs.selected = 'bold default_size default_family'
c.fonts.tabs.pinned = 'bold default_size default_family'

# hints
c.hints.border = '0px'
c.hints.radius = 0

# format
c.tabs.title.format = "{audio}{current_title}"
c.tabs.padding = { 'top': 3, 'bottom': 2, 'left': 6, 'right': 6 }
c.tabs.favicons.show = 'never'
c.tabs.indicator.width = 0 # no tab indicators
c.tabs.max_width = 350
c.tabs.width = '10%'
c.tabs.position = 'left'

# search engines
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!y': 'https://www.youtube.com/results?search_query={}',
    '!w': 'https://en.wikipedia.org/w/index.php?search={}&title=Special%3ASearch&ns0=1',
    '!s': 'https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q={}&btnG=',
    '!t': 'https://translate.google.com/?sl=pt&tl=en&text={}&op=translate',
}

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']
c.statusbar.widgets = ['keypress', 'url' ]

config.load_autoconfig(False) # load settings done via the gui

# bindings
config.bind('<ctrl-l>', 'tab-move +')
config.bind('<ctrl-h>', 'tab-move -')



# settings
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.algorithm", 'lightness-cielab')
config.set("colors.webpage.darkmode.policy.images", 'never')
config.set("content.pdfjs", True)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
