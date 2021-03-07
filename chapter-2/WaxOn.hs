module WaxOn where

z = 7

x = y ^ 2

waxOn = x * 5

waxOff x = triple x

y = z + 8

triple x = x * 3

iWaxOn = x * 5
  where
    x = y ^ 2
      where
        y = z + 8
          where
            z = 7
