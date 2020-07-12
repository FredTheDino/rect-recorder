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
  nextobjectid = 21,
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
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 328,
          y = -52,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = -150,
          y = 200,
          width = 550,
          height = 100,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = -138,
          y = 0,
          width = 175,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {
            ["b"] = 0.5,
            ["m"] = 0.8
          }
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = -800,
          y = 100,
          width = 200,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = -600,
          y = 200,
          width = 250,
          height = 100,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = -350,
          y = 250,
          width = 200,
          height = 50,
          rotation = 0,
          visible = true,
          properties = {
            ["b"] = -1
          }
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
          x = 200,
          y = 150,
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
          x = -700,
          y = 50,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "next",
          type = "levels.w2l3",
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
