return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 64,
  height = 64,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 4,
  properties = {},
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      filename = "tiles.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../tiles/tiles.png",
      imagewidth = 256,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {
        {
          id = 32,
          properties = {
            ["ladder"] = true
          }
        },
        {
          id = 33,
          properties = {
            ["ladder"] = true
          }
        }
      }
    },
    {
      name = "background_tiles",
      firstgid = 257,
      filename = "background_tiles.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../tiles/background_tiles.png",
      imagewidth = 256,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "background_tiles",
      x = 0,
      y = 0,
      width = 64,
      height = 64,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        258, 257, 257, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 257, 257, 258, 257, 257, 257, 258, 257, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 258,
        258, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 258, 258, 257, 257, 258, 258, 257, 257, 258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 258, 258, 257,
        258, 258, 257, 257, 258, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 258,
        257, 258, 257, 257, 257, 258, 257, 257, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 258,
        258, 258, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 257, 257, 257, 257, 257, 257, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 257, 257,
        257, 258, 258, 257, 258, 257, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 258, 258, 257, 257, 258, 258, 257, 257, 257, 258, 257, 257, 257, 258, 257, 257, 258, 257, 257, 257, 258, 257, 257, 258, 257, 257, 257, 257, 258, 258, 258,
        257, 257, 257, 257, 257, 258, 257, 258, 257, 258, 257, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 258, 257, 258, 257,
        258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 258, 258, 258,
        257, 258, 258, 257, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 258, 257, 257, 257, 257, 257, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 257, 258, 258, 257, 257, 257,
        258, 258, 257, 257, 258, 258, 258, 257, 257, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 258, 258, 257, 258, 257, 258, 257, 257, 257, 258, 258, 257,
        258, 257, 258, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 258, 257, 257, 257, 257, 257, 258, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258,
        258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 257, 257, 257, 258, 258, 257, 258, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 257, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 258, 257, 257, 257, 258, 257, 258,
        257, 258, 258, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 257, 258, 258, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258,
        257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 257, 257, 258, 257, 257, 258, 257, 257, 258, 258, 258, 257, 257, 258, 257, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 257, 257, 258, 257, 257, 257, 258, 258, 257, 257, 257, 258, 257, 258,
        257, 258, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 257, 257, 257, 257, 257, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 258,
        257, 257, 258, 258, 258, 258, 257, 258, 258, 258, 258, 257, 257, 258, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 257, 258, 257, 258,
        258, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 258, 257, 258, 258, 257, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 257, 258, 257, 257, 258, 258, 257, 257, 257, 257, 258,
        258, 257, 257, 258, 257, 258, 257, 257, 258, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 257, 257, 257, 258, 257, 258, 257, 258, 258, 257, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 258,
        258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 257, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 257, 258, 258, 257,
        258, 258, 257, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 258, 258, 258, 258, 257, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257, 258, 257, 258, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 257,
        257, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 257,
        258, 258, 257, 257, 257, 258, 257, 258, 258, 257, 258, 258, 257, 257, 257, 258, 258, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 258,
        258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 258, 258, 257, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 257, 258, 258, 258, 258, 257, 257, 257, 257, 258, 257, 257, 258, 257, 258, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 258,
        258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 258, 257, 258, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 257, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 258,
        257, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 257, 257, 258, 258,
        258, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 257, 258, 258, 258, 258,
        258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 257, 257, 258, 257,
        258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 257, 257, 257, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 258, 257, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 257, 257, 257,
        257, 257, 257, 258, 258, 257, 257, 257, 257, 258, 257, 258, 257, 257, 257, 258, 257, 257, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 257, 257, 258, 257, 258, 258, 258, 258, 257, 258, 257, 257, 257,
        257, 258, 257, 257, 257, 257, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 258, 258, 257, 257, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 258, 257, 257, 258, 258, 258, 258, 258, 257, 257, 258, 257, 257,
        258, 257, 257, 258, 258, 257, 257, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 257, 257, 258, 258, 257, 257, 258, 257,
        257, 258, 258, 257, 258, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 257, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 258, 257, 257, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257,
        257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 257, 258, 258, 258, 257,
        257, 258, 258, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 257, 258, 257, 258, 258, 257, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 257, 257, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257,
        257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 257, 257, 257, 257, 258, 257, 257, 257, 257, 258, 257, 258, 257, 258, 258, 257, 257, 258, 258, 257, 257, 257, 257, 257, 257, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257,
        258, 257, 257, 258, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 258, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 258, 257, 257, 257, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 257, 257, 257, 257, 258, 257, 257, 257,
        257, 258, 257, 257, 257, 258, 257, 257, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 257, 257, 257, 258, 257, 258, 258, 257, 258, 258, 257, 258, 257, 258, 257, 257, 258, 257, 258, 258, 258, 258, 258, 258, 258, 257, 258, 257,
        257, 257, 257, 258, 257, 257, 257, 257, 257, 257, 258, 257, 258, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 257, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 258, 258, 258,
        258, 258, 257, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 258, 258, 258, 257, 257, 257, 258, 258, 257, 257, 257, 257, 258, 257, 257, 257, 257, 257, 257, 257,
        257, 257, 257, 257, 258, 257, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 257, 258, 257, 258, 258, 257,
        258, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 257, 257, 258, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 258, 258, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257,
        258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 258, 257, 258, 258, 258, 258, 258, 257,
        257, 257, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 257, 258, 258, 257, 258, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 257, 257, 258, 258, 257, 258, 258, 257, 258, 258, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 258, 258, 257, 258,
        257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 258, 258, 258, 258, 258, 257, 258, 257, 257, 258, 257, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257, 257, 258, 257, 257, 258, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258,
        257, 257, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 257, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 258, 258, 257, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 257, 257, 257, 258, 258, 257, 257, 258, 257,
        257, 257, 257, 258, 258, 258, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 257, 258, 258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 258, 257, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 258,
        258, 258, 258, 258, 258, 258, 257, 258, 257, 257, 258, 257, 257, 258, 258, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258, 257, 257, 258, 258, 257, 257, 258, 258, 257,
        258, 258, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 257, 258, 258, 257, 257, 257, 258, 258, 258, 257, 257, 257, 257, 258, 258, 258,
        258, 257, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 258, 257, 258, 258, 258, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 258, 257, 258, 257, 257, 258, 257, 257, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 257, 258, 257,
        257, 257, 258, 258, 258, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 258, 258, 257, 258, 257, 258, 257, 257, 257, 257, 257, 258, 258, 257, 258, 258, 257, 257, 258, 258, 257, 258, 258, 257, 257, 258, 257, 257, 258, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 257, 257,
        257, 257, 257, 257, 258, 257, 258, 258, 258, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 257, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 258, 258, 257, 258, 257, 257, 258, 257,
        257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 258, 257, 258, 258, 258, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257,
        257, 257, 257, 257, 257, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 257, 258, 257, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258,
        258, 258, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 258, 258, 257, 258, 257, 258, 257, 258, 258, 257, 257, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 257, 257, 257, 257, 258, 258, 257, 257, 257, 257, 258, 258,
        258, 257, 257, 257, 257, 257, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 258, 258, 258, 258, 257, 257, 257, 257, 257, 257, 257, 257, 258, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 257, 257, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 257, 257,
        257, 257, 257, 257, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 257, 258, 258, 257, 257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 258, 258, 258, 258, 258, 258, 258, 257, 257, 258, 257,
        257, 258, 257, 258, 257, 257, 257, 258, 258, 258, 257, 258, 257, 257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 257, 257, 258, 258, 258, 258, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 258, 257, 257, 257, 257, 257, 257, 258, 258, 257, 257, 258, 257, 258, 258, 257, 257, 258, 258, 257, 258, 258, 257,
        258, 257, 258, 257, 258, 257, 257, 257, 258, 257, 258, 258, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257, 257, 258, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 257, 257, 258, 258, 258, 257, 257, 257, 257, 258, 257, 258, 257, 257, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258,
        257, 258, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 257, 257, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 257, 258, 257, 257, 258, 258,
        258, 258, 258, 258, 257, 257, 258, 258, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258, 257, 258, 258, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 258, 258, 258, 257,
        257, 257, 258, 257, 258, 257, 257, 258, 258, 258, 257, 257, 257, 257, 258, 257, 257, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 258, 257, 257, 258, 257, 258, 258, 257, 258, 257, 258, 258, 257, 258, 258, 258, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 257, 257, 258, 258, 257, 257, 258, 257,
        258, 258, 258, 257, 257, 258, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 257, 257, 258, 257, 258, 257, 258, 257, 257, 257, 257, 258, 258, 258, 258, 258, 257, 258, 257, 258, 257, 257, 258, 257, 257, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 257, 257, 258, 258, 258, 257, 257, 258, 258, 258, 257,
        258, 257, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 258, 258, 257, 258, 257, 258, 257, 258, 258, 258, 257, 257, 258, 257, 257, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 258, 257, 257, 258, 258, 257, 257, 258, 257, 257, 257, 257, 258, 257, 258, 258, 258,
        257, 258, 258, 258, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 258, 258, 257, 257, 257, 257, 257, 258, 258, 257, 257, 257, 257, 257, 257, 258, 258, 257, 258, 257, 257, 258, 257, 257, 257, 257, 258, 257, 258, 257, 258, 258, 258, 258, 258, 258, 257, 258, 257, 258, 257, 258, 258, 257, 258, 258, 258, 258, 258
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 64,
      height = 64,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        18, 18, 0, 18, 18, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 18, 18, 18, 18, 18, 18, 18, 18, 18, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 18, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 18, 26, 26, 26, 26, 26, 26, 26, 26, 26, 18,
        18, 24, 0, 23, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        18, 24, 0, 23, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        18, 24, 0, 23, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        18, 20, 0, 19, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 24, 24, 33, 27, 29, 29, 29, 29, 29, 29, 29, 29, 29, 28, 33, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 18, 24, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 18, 24, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 18, 18, 18, 18, 18, 18, 18, 24, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 26, 26, 26, 26, 26, 26, 26, 20, 33, 27, 29, 29, 29, 29, 29, 29, 29, 29, 29, 28, 33, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        18, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 22, 34, 34, 34, 23,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 18,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      id = 3,
      name = "objects",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["collidable"] = true
      },
      objects = {
        {
          id = 1,
          name = "spawn_1_1",
          type = "player_spawn",
          shape = "point",
          x = 40,
          y = 24,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "monster_spawn",
          shape = "point",
          x = 208,
          y = 192,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["monster_type"] = "Goblin"
          }
        },
        {
          id = 3,
          name = "",
          type = "voice_trigger",
          shape = "rectangle",
          x = 592,
          y = 240,
          width = 320,
          height = 208,
          rotation = 0,
          visible = true,
          properties = {
            ["repeats"] = "once",
            ["slot"] = "boss",
            ["voice"] = "singoblisa_intro"
          }
        }
      }
    }
  }
}
