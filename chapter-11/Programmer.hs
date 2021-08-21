data OperatingSystem =
    GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgLang = 
    Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)

data Programmer =
  Programmer { os :: OperatingSystem
             , lang :: ProgLang }
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgLang]
allLanguages =
  [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = mapOsesToLangs allOperatingSystems allLanguages []

mapOsesToLangs :: [OperatingSystem] -> [ProgLang] -> [Programmer] -> [Programmer]
mapOsesToLangs [] langs r = r
mapOsesToLangs (os:oses) langs r = mapOsesToLangs oses langs (merge (mapOsToLangs os langs []) r)

mapOsToLangs :: OperatingSystem -> [ProgLang] -> [Programmer] -> [Programmer]
mapOsToLangs os [] r = r
mapOsToLangs os (l:langs) r = mapOsToLangs os langs $ (Programmer { os = os, lang = l }):r

merge :: [a] -> [a] -> [a]
merge xs     []     = xs
merge []     ys     = ys
merge (x:xs) (y:ys) = x : y : merge xs ys
