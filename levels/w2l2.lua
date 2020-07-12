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
  nextobjectid = 13,
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = -800,
          y = -50,
          width = 1050,
          height = 150,
          rotation = 0,
          visible = true,
          properties = {}
        },
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
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = -300,
          width = 100,
          height = 250,
          rotation = 0,
          visible = true,
          properties = {
            ["b"] = 0,
            ["f"] = 1,
            ["m"] = 1.1
          }
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = -200,
          y = -300,
          width = 100,
          height = 250,
          rotation = 0,
          visible = true,
          properties = {
            ["b"] = 0,
            ["f"] = 1,
            ["m"] = 1.1
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "text",
          x = -750,
          y = -400,
          width = 550,
          height = 40,
          rotation = 0,
          visible = true,
          text = "Should I hold back when things are though?",
          wrap = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "text",
          x = -300,
          y = 150,
          width = 550,
          height = 40,
          rotation = 0,
          visible = true,
          text = "Even though they are so heavy?",
          wrap = true,
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
          x = 200,
          y = -100,
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
          y = -100,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "next",
          type = "levels.w2l2-5",
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
