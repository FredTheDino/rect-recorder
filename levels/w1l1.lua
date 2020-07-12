return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 100,
  height = 100,
  tilewidth = 50,
  tileheight = 50,
  nextlayerid = 6,
  nextobjectid = 20,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "misc",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 4,
          name = "start",
          type = "",
          shape = "point",
          x = 700,
          y = -200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "goal",
          type = "",
          shape = "point",
          x = -50,
          y = -200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "next",
          type = "levels.w1l1-5",
          shape = "point",
          x = 350,
          y = -500,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "platforms",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = -150,
          y = -150,
          width = 950,
          height = 100,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "text",
          x = -150,
          y = -350,
          width = 390.036,
          height = 59.5523,
          rotation = 0,
          visible = true,
          text = "Bob in Bounceland",
          fontfamily = "Sans Serif",
          pixelsize = 39,
          wrap = true,
          halign = "center",
          valign = "center",
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "text",
          x = 200,
          y = 0,
          width = 210.438,
          height = 40,
          rotation = 0,
          visible = true,
          text = "A or Left Arrow to move",
          wrap = true,
          properties = {}
        }
      }
    }
  }
}
