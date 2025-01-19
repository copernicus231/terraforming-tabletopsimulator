function onLoad(save_state)
  --Arcadia Planitia
 --local grid=createSnapGrid(0.0907,11,6,vector(-0.004,0, -0.095))
 --grid = addSnaps(grid,createPointTrack(0.0762,0.0901,vector(1.126,0, 0.876)))
 --grid = addSnaps(grid,createTemperatureTrack(0.058,vector(-0.955,0, 0.6),23))
 --grid = addSnaps(grid,createOxygenTrack(51.5,3.85,0.931,vector(-0.004,0,-0.095),18))


  --tharsis
  --local grid = tharsis()

  --hellas
  --local grid = hellas()
  --elyseum

  --local grid = elyseum()

  --vastitas
  --local grid = arcadiaplantitia()
--  local grid=createSnapGrid(0.0907,9,5,vector(-0.002,0,0.009))
--  grid = addSnaps(grid,createPointTrack(0.0762,0.0901,vector(1.125,0, 0.878)))
--  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.927,0, 0.495),20))
--  grid = addSnaps(grid,createOxygenTrack(134,6.35,0.769,vector(-0.002,0,0.009),15))


--arabia terra
--  local grid=createSnapGrid(0.0907,9,5,vector(-0.002,0,0.009))
--  grid = addSnaps(grid,createPointTrack(0.0756,0.0894,vector(1.118,0, 0.870)))
--  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.927,0, 0.495),20))
  --grid = addSnaps(grid,createOxygenTrack(134,6.35,0.769,vector(-0.002,0,0.009),15))
--local grid = tharsis()
  --local grid=createSnapGridSmall(0.148,7,4,vector(-0.194,0, 0.013))
  --grid = addSnaps(grid,createOxygenTrack(57.7,4.05,0.958,vector(-0.194,0, 0.013),10,1,10,0))
  --grid = addSnaps(grid,createOxygenTrack(-21.5,4.0,0.974,vector(-0.194,0, 0.013),10,1,10,0))
  --grid = addSnaps(grid,createOxygenTrack(-159.5,4.05,0.945,vector(-0.194,0, 0.013),10,1,10,0))
  --grid = addSnaps(grid,addSnapLine(0.204,vector(0.93,0,-0.4),1,0))
  --grid = addSnaps(grid,addSnapLine(0.204,vector(0.922,0,0.38),1,0))
  --local grid =centerHelper()w
  --local grid = genericNormalMap()
  --self.setSnapPoints(grid)
  local grid = venusBoard()
  self.setSnapPoints(grid)
end


function venusBoard()
  local grid = {}
  --grid = createOxygenTrack(110,2.7,3.03,vector(-0.06,0,2.2),16,1,16,0)
  grid = createOxygenTrack(102.48,1.3,5.725,vector(0.04,0,4.95),19,1,19,0)
  -- Luna Metropolis
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.7,0,-0.15),1,0))
  -- Stratopolis
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.31,0,0.605),1,0))
  -- Maxwell Base
  grid = addSnaps(grid,addSnapLine(0.204,vector(-1,0,0.49),1,0))
  -- Dawn City
  grid = addSnaps(grid,addSnapLine(0.204,vector(-1.01,0,-0.28),1,0))


  return grid
end
function venus()
  
  local grid=createSnapGridSmall(0.141,7,4,vector(0.252,0, 0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.585,0,-0.625),1,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.50,0,0.72),1,0))
    return grid
end

function genericBigMap()
  local grid = createSnapGrid(0.0930,11,6,vector(0,0,-0.055))
  grid = addSnaps(grid,createPointTrack(0.0759,0.0899,vector(1.122,0, 0.870)))
  grid = addSnaps(grid,createTemperatureTrack(0.053,vector(-0.94,0, 0.358),23,1,23,0))
  grid = addSnaps(grid,createOxygenTrack(42,5.1,0.97,vector(-0.035,0,-0.135),19,1,19,0))

  --Phobos space Haven
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.91,0,-0.67),1,0))

  --Ganymede Colony
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.975,0,0.495),1,0))

  --Stanford Torus
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.76,0,0.51),1,0))


  --Ocean Tiles
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.69,0,-0.78),1,0))

    --Milestones
    grid = addSnaps(grid,addSnapLine(0.062,vector(1.04,0,0.685),3,0))
    grid = addSnaps(grid,addSnapLine(0.205,vector(0.955,0,0.84),5,-90))
    grid = addSnaps(grid,addSnapLine(0.195,vector(0.795,0,0.724),2,-90))
  
    --awardsaaa
    grid = addSnaps(grid,addSnapLine(0.065,vector(-0.905,0,0.697),3,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.144,0,0.84),5,-90))
    grid = addSnaps(grid,addSnapLine(0.195,vector(-0.585,0,0.724),2,-90))

    grid = addSnaps(grid,createTemperatureTrack(0.053,vector(-1.03,0, 0.358),23,23-10,23-8,-90))
    grid = addSnaps(grid,createOxygenTrack(50,5.1,0.985,vector(0,0,0),19,19-6,19-4,-90))
  return grid
end

function genericNormalMap()
  local grid=createSnapGrid(0.0930,9,5,vector(-0.001,0,-0.002))
  --grid = addSnaps(grid,createPointTrack(0.0756,0.0894,vector(1.118,0, 0.870)))
  grid = addSnaps(grid,createPointTrack(0.0759,0.0899,vector(1.122,0, 0.870)))
  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.927,0, 0.51),20,1,20,0))
  grid = addSnaps(grid,createOxygenTrack(90,6.272,0.787,vector(-0.035,0,-0.135),19,1,19,0))


  --Phobos space Haven
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.872,0,-0.405),1,0))

  --Ganymede Colony
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.84,0,0.-0.18),1,0))

  --Stanford Torus
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.69,0,0.4),1,0))


  --Ocean Tiles
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.73,0,-0.645),1,0))


  --Milestones
  grid = addSnaps(grid,addSnapLine(0.062,vector(0.860,0,0.740),3,0))
  grid = addSnaps(grid,addSnapLine(0.205,vector(0.955,0,0.84),5,-90))
  grid = addSnaps(grid,addSnapLine(0.4,vector(0.55,0,0.724),2,-90))

  --awards
  grid = addSnaps(grid,addSnapLine(0.065,vector(-0.251,0,0.733),3,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.144,0,0.84),5,-90))
  grid = addSnaps(grid,addSnapLine(0.4,vector(-0.54,0,0.724),2,-90))


  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-1.01,0, 0.51),20,20-7,20-5,-90))
  grid = addSnaps(grid,createOxygenTrack(133.5,6.272,0.881,vector(0,0,0),15,15-6,15-4,-90))

  return grid
end




function addSnaps(snapMatrix,extraSnaps)
  local total =#snapMatrix
  for i=1,#extraSnaps do
    snapMatrix[total+i]=extraSnaps[i]
  end
  return snapMatrix
end


function arcadiaplantitia()
  local grid=createSnapGrid(0.0907,11,6,vector(-0.004,0, -0.095))
  grid = addSnaps(grid,createPointTrack(0.0762,0.0901,vector(1.126,0, 0.876)))
  grid = addSnaps(grid,createTemperatureTrack(0.0575,vector(-0.959,0, 0.6),23,1,23,0))
  grid = addSnaps(grid,createOxygenTrack(51.5,3.85,0.931,vector(-0.004,0,-0.095),18,1,18,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(0.859,0,-0.791),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.605,0,0.574),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.748,0,0.42),1,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.775,0,-0.64),1,0))

  grid = addSnaps(grid,addSnapLine(0.056,vector(0.835,0,0.738),3,0))
  grid = addSnaps(grid,addSnapLine(0.205,vector(0.947,0,0.83),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(0.55,0,0.724),2,-90))

  grid = addSnaps(grid,addSnapLine(0.057,vector(-0.25,0,0.737),3,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.125,0,0.83),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(-0.54,0,0.724),2,-90))

  grid = addSnaps(grid,createTemperatureTrack(0.0575,vector(-1.045,0, 0.6),23,23-7,23-5,-90))
  grid = addSnaps(grid,createOxygenTrack(51.5,3.85,1.025,vector(-0.004,0,-0.095),18,18-8,18-6,-90))
  return grid
end





function arabiaterra()
    local grid=createSnapGrid(0.0907,9,5,vector(-0.002,0,0.009))
    grid = addSnaps(grid,createPointTrack(0.0756,0.0894,vector(1.118,0, 0.870)))
    grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.927,0, 0.495),20,1,20,0))
    grid = addSnaps(grid,createOxygenTrack(134,6.35,0.769,vector(-0.002,0,0.009),15,1,15,0))

    grid = addSnaps(grid,addSnapLine(0.204,vector(0.888,0,-0.415),1,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(0.8397,0,-0.1845),1,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.689,0,0.395),1,0))

    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.74,0,-0.625),1,0))


    grid = addSnaps(grid,addSnapLine(0.062,vector(0.848,0,0.735),3,0))
    grid = addSnaps(grid,addSnapLine(0.205,vector(0.94,0,0.83),5,0))
    grid = addSnaps(grid,addSnapLine(0.4,vector(0.55,0,0.724),2,-90))

    grid = addSnaps(grid,addSnapLine(0.065,vector(-0.235,0,0.728),3,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.121,0,0.83),5,0))
    grid = addSnaps(grid,addSnapLine(0.4,vector(-0.54,0,0.724),2,-90))

    grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-1.01,0, 0.495),20,20-7,20-5,-90))
    grid = addSnaps(grid,createOxygenTrack(134,6.35,0.869,vector(-0.002,0,0.009),15,15-6,15-4,-90))

    return grid
end


function vastitas()
    local grid=createSnapGrid(0.0907,9,5,vector(-0.002,0,0.009))
    grid = addSnaps(grid,createPointTrack(0.0762,0.0901,vector(1.125,0, 0.878)))
    grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.927,0, 0.495),20,1,20,0))
    grid = addSnaps(grid,createOxygenTrack(134,6.35,0.769,vector(-0.002,0,0.009),15,1,15,0))

    grid = addSnaps(grid,addSnapLine(0.204,vector(0.888,0,-0.415),1,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(0.8397,0,-0.1845),1,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.689,0,0.395),1,0))

    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.74,0,-0.625),1,0))



    grid = addSnaps(grid,addSnapLine(0.062,vector(0.851,0,0.741),3,0))
    grid = addSnaps(grid,addSnapLine(0.205,vector(0.945,0,0.83),5,0))
    grid = addSnaps(grid,addSnapLine(0.4,vector(0.55,0,0.724),2,-90))

    grid = addSnaps(grid,addSnapLine(0.057,vector(-0.248,0,0.733),3,0))
    grid = addSnaps(grid,addSnapLine(0.204,vector(-0.126,0,0.83),5,0))
    grid = addSnaps(grid,addSnapLine(0.4,vector(-0.54,0,0.724),2,-90))

    grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-1.01,0, 0.495),20,20-7,20-5,-90))
    grid = addSnaps(grid,createOxygenTrack(134,6.35,0.869,vector(-0.002,0,0.009),15,15-6,15-4,-90))
    return grid
end


function elyseum()
  local grid=createSnapGrid(0.0907,9,5,vector(0,0,0.009))
  grid = addSnaps(grid,createPointTrack(0.0752,0.089,vector(1.112,0, 0.865)))
  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(0.855,0, 0.495),20,1,20,0))
  grid = addSnaps(grid,createOxygenTrack(134,6.35,0.769,vector(0,0,0.009),15,1,15,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.842,0,-0.384),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.880,0,-0.125),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.689,0,0.395),1,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(0.648,0,-0.753),1,0))


  grid = addSnaps(grid,addSnapLine(0.06,vector(0.839,0,0.725),3,0))
  grid = addSnaps(grid,addSnapLine(0.206,vector(0.94,0,0.82),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(0.53,0,0.72),2,-90))

  grid = addSnaps(grid,addSnapLine(0.062,vector(-0.225,0,0.722),3,0))
  grid = addSnaps(grid,addSnapLine(0.202,vector(-0.125,0,0.82),5,0))
  grid = addSnaps(grid,addSnapLine(0.42,vector(-0.52,0,0.72),2,-90))

  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(0.95,0, 0.495),20,20-7,20-5,-90))
  grid = addSnaps(grid,createOxygenTrack(134,6.35,0.869,vector(0,0,0.009),15,15-6,15-4,-90))
  return grid
end
function tharsis()
  local grid=createSnapGrid(0.0907,9,5,vector(0.002,0,-0.005))
  grid = addSnaps(grid,createPointTrack(0.0765,0.0901,vector(1.126,0, 0.881)))
  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.922,0, 0.475),20,1,20,0))
  grid = addSnaps(grid,createOxygenTrack(133.5,6.26,0.769,vector(0.002,0,-0.005),15,1,15,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(0.79,0,-0.69),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.8397,0,-0.177),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.689,0,0.395),1,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.702,0,-0.739),1,0))

  grid = addSnaps(grid,addSnapLine(0.062,vector(0.854,0,0.744),3,0))
  grid = addSnaps(grid,addSnapLine(0.205,vector(0.95,0,0.83),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(0.55,0,0.724),2,-90))

  grid = addSnaps(grid,addSnapLine(0.06,vector(-0.263,0,0.733),3,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.125,0,0.83),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(-0.54,0,0.724),2,-90))


  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-1.005,0, 0.475),20,20-7,20-5,-90))
  grid = addSnaps(grid,createOxygenTrack(133.5,6.26,0.869,vector(0.002,0,-0.005),15,15-6,15-4,-90))
  return grid
end

function hellas()
  local grid=createSnapGrid(0.0907,9,5,vector(0,0,0.009))
  grid = addSnaps(grid,createPointTrack(0.0752,0.089,vector(1.112,0, 0.865)))
  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-0.925,0, 0.475),20,1,20,0))
  grid = addSnaps (grid,createOxygenTrack(134,6.35,0.769,vector(0,0,0.009),15,1,15,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(0.815,0,-0.485),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(0.838,0,-0.168),1,0))
  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.689,0,0.395),1,0))

  grid = addSnaps(grid,addSnapLine(0.204,vector(-0.702,0,-0.735),1,0))

  grid = addSnaps(grid,addSnapLine(0.06,vector(0.839,0,0.725),3,0))
  grid = addSnaps(grid,addSnapLine(0.206,vector(0.94,0,0.82),5,0))
  grid = addSnaps(grid,addSnapLine(0.4,vector(0.53,0,0.72),2,-90))
  grid = addSnaps(grid,addSnapLine(0.062,vector(-0.225,0,0.722),3,0))
  grid = addSnaps(grid,addSnapLine(0.203,vector(-0.125,0,0.82),5,0))
  grid = addSnaps(grid,addSnapLine(0.42,vector(-0.52,0,0.72),2,-90))


  grid = addSnaps(grid,createTemperatureTrack(0.059,vector(-1.008,0, 0.475),20,20-7,20-5,-90))
  grid = addSnaps(grid,createOxygenTrack(133.5,6.26,0.869,vector(0,0,0.009),15,15-6,15-4,-90))
  return grid
end
--snapGrid[1]["position"] = {0.9,0, 0.13}
--snapGrid[1]["rotation"] = {0, -15, 0}

--snapGrid[1]["position"] = {0.91,0, 0.065}
--snapGrid[1]["rotation"] = {0, -11.38, 0}

--snapGrid[1]["position"] = {0.92,0, 0}
--snapGrid[1]["rotation"] = {0, -7.768, 0}

--snapGrid[1]["position"] = {0.925,0, -0.06}
--snapGrid[1]["rotation"] = {0, -4, 0}

--snapGrid[1]["position"] = {0.93,0, -0.12}
--snapGrid[1]["rotation"] = {0, 1, 0}

--snapGrid[1]["position"] = {0.925,0, -0.19}
--snapGrid[1]["rotation"] = {0, 6, 0}

--snapGrid[1]["position"] = {0.92,0, -0.245}
--snapGrid[1]["rotation"] = {0, 9.768, 0}

--snapGrid[1]["position"] = {0.9,0, -0.305}
--snapGrid[1]["rotation"] = {0, 13.38, 0}

--snapGrid[1]["position"] = {0.89,0, -0.37}
--snapGrid[1]["rotation"] = {0, 17, 0}

--snapGrid[1]["position"] = {0.87,0, -0.425}
--snapGrid[1]["rotation"] = {0, 20.62, 0}

--snapGrid[1]["position"] = {0.84,0, -0.483}
--snapGrid[1]["rotation"] = {0, 24.22, 0}

--snapGrid[1]["position"] = {0.815,0, -0.541}
--snapGrid[1]["rotation"] = {0, 27.84, 0}




--snapGrid[1]["position"] = {0.58,0, -0.252867444473555}
--snapGrid[1]["rotation"] = {0, 50, 0}
function centerHelper()
  local snapGrid={}
  snapGrid[1] ={}
  --0.953sw
  snapGrid[1]["position"] = {0.71770933820226





,0,-0.692812663434701


}
  snapGrid[1]["rotation"] = {0, 39.95


, 0}
  snapGrid[1]["rotation_snap"] = true
  snapGrid[1]["tags"] = {"TrackMarker"}
  return snapGrid
end


function addSnapLine(deltax,initialPosition,copies,degree)
  local snapGrid={}
  local x = initialPosition.x
  for i=1,copies do
    snapGrid[i] ={}
    snapGrid[i]["position"] = {x,0, initialPosition.z}
    snapGrid[i]["rotation"] = {0, 90+degree, 0}
    snapGrid[i]["rotation_snap"] = true
    snapGrid[i]["tags"] = {}
    x = x - deltax
  end
  return snapGrid
end


function createOxygenTrack(initAngle,deltaAngle,radio,initialPosition,maxstep,istep,nstep,degree)
  local snapGrid={}
  local r = radio
  local angle=initAngle
  local index = 0
  for i=1,maxstep do
    if i >= istep and i <= nstep then
      index = index + 1
      snapGrid[index] ={}
      snapGrid[index]["position"] = {r*math.cos(math.rad(angle))+initialPosition.x,0, -1*r*math.sin(math.rad(angle))+initialPosition.z}
      snapGrid[index]["rotation"] = {0, angle+degree, 0}
      snapGrid[index]["rotation_snap"] = true
      snapGrid[index]["tags"] = {}
    end
    angle = angle - deltaAngle
  end
  return snapGrid
end

function createTemperatureTrack(deltaZ,initialPosition,maxstep,istep,nstep,degree)
  local z = initialPosition.z
  local snapGrid={}
  local index = 0
  for i=1,maxstep do
    if i >= istep and i <= nstep then
      index = index + 1
      snapGrid[index] ={}
      snapGrid[index]["position"] = {initialPosition.x,0, z}
      snapGrid[index]["rotation"] = {0, 90+degree, 0}
      snapGrid[index]["rotation_snap"] = true
      snapGrid[index]["tags"] = {}
    end
    z = z - deltaZ
  end
  return snapGrid
end
function createPointTrack(deltaZ,deltaX,initialPosition)
  local x = initialPosition.x
  local z = initialPosition.z
  local snapGrid={}
  for i=1,25 do
    snapGrid[i] ={}
    snapGrid[i]["position"] = {x,0, z}
    snapGrid[i]["rotation"] = {0, 90, 0}
    snapGrid[i]["rotation_snap"] = true
    snapGrid[i]["tags"] = {}
    z = z - deltaZ
  end
  z = z + deltaZ
  x = x - deltaX
  for i=26,50 do
    snapGrid[i] ={}
    snapGrid[i]["position"] = {x,0, z}
    snapGrid[i]["rotation"] = {0, 90, 0}
    snapGrid[i]["rotation_snap"] = true
    snapGrid[i]["tags"] = {}
    x = x - deltaX
  end

  z=z+deltaZ
  x = x + deltaX
  for i=51,75 do
    snapGrid[i] ={}
    snapGrid[i]["position"] = {x,0, z}
    snapGrid[i]["rotation"] = {0, 90, 0}
    snapGrid[i]["rotation_snap"] = true
    snapGrid[i]["tags"] = {}
    z = z + deltaZ
  end
  z = z - deltaZ
  x = x + deltaX
  for i=76,100 do
    snapGrid[i] ={}
    snapGrid[i]["position"] = {x,0, z}
    snapGrid[i]["rotation"] = {0, 90, 0}
    snapGrid[i]["rotation_snap"] = true
    snapGrid[i]["tags"] = {}
    x = x + deltaX
  end
  return snapGrid
end

function createSnapGridSmall(size,rowNumber,minRowLenght,centerPosition)
  local w = math.sqrt(3) * size
  local h = 2*size
  local vd = h*3/4
  print(w)
  print(h)
  print(vd)
  local snapGrid={}

  local a = centerPosition.x+(minRowLenght/2)*w-w/2
  local b = centerPosition.z-((rowNumber-1)/2)*vd
  local length = minRowLenght
  local i_start=1
  local i_end = length
  for x=1,rowNumber do
    if x == (rowNumber-1)/2 + 1 then
      i_end = i_end -2
      print(i_start)
      print(i_end)
      --length = length - 1
      a = a - w
    end
    for i=i_start,i_end do
      snapGrid[i] ={}
      snapGrid[i]["position"] = {a,0, b}
      snapGrid[i]["rotation"] = {0, 90, 0}
      snapGrid[i]["rotation_snap"] = true
      snapGrid[i]["tags"] = {}
      a = a - w
    end
    if x == (rowNumber-1)/2 + 1 then
      a = a - w
    end
    if x <= (rowNumber-1)/2 then
      a = a + w*length+w/2
      length=length+1
    else
      a = a + w*length - w/2
      length=length-1
    end
    i_start=i_end + 1
    i_end = i_start + length - 1
    b = b + vd
  end
  return snapGrid
end

function createSnapGrid(size,rowNumber,minRowLenght,centerPosition)
  local w = math.sqrt(3) * size
  local h = 2*size
  local vd = h*3/4
  print(w)
  print(h)
  print(vd)
  local snapGrid={}

  local a = centerPosition.x+(minRowLenght/2)*w-w/2
  local b = centerPosition.z-((rowNumber-1)/2)*vd
  local length = minRowLenght
  local i_start=1
  local i_end = length
  for x=1,rowNumber do

    for i=i_start,i_end do
      snapGrid[i] ={}
      snapGrid[i]["position"] = {a,0, b}
      snapGrid[i]["rotation"] = {0, 90, 0}
      snapGrid[i]["rotation_snap"] = true
      snapGrid[i]["tags"] = {}
      a = a - w
    end

    if x <= (rowNumber-1)/2 then
      a = a + w*length+w/2
      length=length+1
    else
      a = a + w*length - w/2
      length=length-1
    end
    i_start=i_end + 1
    i_end = i_start + length - 1
    b = b + vd
  end
  return snapGrid
end
