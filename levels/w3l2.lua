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
  nextlayerid = 4,
  nextobjectid = 49,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "platforms",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = -500,
          y = -200,
          width = 200,
          height = 50,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = -550,
          y = -350,
          width = 50,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = -150,
          y = -250,
          width = 200,
          height = 100,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = -500,
          y = -350,
          width = 150,
          height = 50,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "text",
          x = -550,
          y = -500,
          width = 390.036,
          height = 59.5523,
          rotation = 0,
          visible = true,
          text = "It has to be worth the struggle",
          fontfamily = "Sans Serif",
          pixelsize = 22,
          wrap = true,
          halign = "center",
          valign = "center",
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "misc",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "start",
          type = "",
          shape = "point",
          x = -400,
          y = -250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "goal",
          type = "",
          shape = "point",
          x = -50,
          y = -300,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "next",
          type = "end",
          shape = "point",
          x = 0,
          y = -350,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
