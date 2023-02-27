local lg = love.graphics
local li = love.image

Sprites = {
  puzzle1 = {
    lg.newImage('assets/puzzle1/puzzle1-pc1.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc2.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc3.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc4.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc5.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc6.png'),
    lg.newImage('assets/puzzle1/puzzle1-pc7.png'),
  },
  puzzle2 = {
    lg.newImage('assets/puzzle2/puzzle2-pc1.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc2.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc3.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc4.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc5.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc6.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc7.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc8.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc9.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc10.png'),
    lg.newImage('assets/puzzle2/puzzle2-pc11.png')
  },
  puzzle3 = {
    imageDatas = {
      li.newImageData('assets/puzzle2/puzzle2-pc1.png'),
    },
    images = {
      lg.newImage('assets/puzzle2/puzzle2-pc1.png'),
    }
  }
}

Fonts = {
  menu_small = lg.newFont('assets/font/Bebas-Regular.ttf', 32),
  menu_medium = lg.newFont('assets/font/Bebas-Regular.ttf', 42),
  menu_big = lg.newFont('assets/font/Bebas-Regular.ttf', 72),
}