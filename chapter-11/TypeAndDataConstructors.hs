data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline deriving (Eq, Show)

myCar = Car Mini (Price 14000)

urCar = Car Mazda (Price 20000)

clownCar = Car Tata (Price 7000)

doge = Plane PapuAir

isCar :: Vehicle -> Bool
isCar (Car a b) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane a) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars [] = []
areCars vehicles =
  go vehicles []
    where
      go (v:remains) r
        | remains == [] = reverse ((isCar v):r)
        | otherwise = go remains ((isCar v):r)

getManu :: Vehicle -> Manufacturer
getManu (Car manu price) = manu
getManu _ = error "Input is not a Car"
