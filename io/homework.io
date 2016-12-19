results := Object clone
results successCount := 0
results failureMessages := list clone

results addSuccess := method(
    self successCount = self successCount + 1
    )

results printResults := method(
    writeln(self results successCount, " tests passed\n")
    if(self results failureMessages size > 0,
      writeln(self results failureMessages size, " tests failed: ")
      for(i,0,self results failureMessages size,writeln( self results failureMessages at(i) ) )
      )
    )

expectEquals := method(actual, expected,
    if(actual == expected,
      results addSuccess,
      results failureMessages append("Failure: value '" .. actual .. "' does not equal expected value '" .. expected .. "'")
      )
    )

  fib := method(n, if(( n==1 or n==2 ), 1, fib(n-1) + fib(n-2)))
  expectEquals(fib(2),1)
expectEquals(fib(4),3)


  Number originalDivides := Number getSlot("/")
  Number / := method(den,
      if(den==0, 0, 
        self originalDivides(den)
        )
      )
  expectEquals( 6 originalDivides(2), 3 )
  expectEquals(4/2, 2)
expectEquals(3/0, 0)

  List arraySum := method(
      self reduce(accumulator, subList, (accumulator + subList sum), 0)
      )
  array := list clone
  array append ( list clone append(1,2,3,4) )
array append ( list clone append(1,2,3,4) )

expectEquals(array arraySum, 20)

  List myAverage := method(
      ( self sum ) / self size
      )
  expectEquals( list clone append (1,2,3) myAverage, 2)
expectEquals( list clone append (3, 5, 7) myAverage, 5)



  results printResults

  previousGuess := nil
  chosenNumber := (11-(10 * Random value)) floor
  for(i,1,9,
      writeln("guess a number, 1 to 10")
      x := File standardInput readLine asNumber
      if(x == chosenNumber,
        writeln("you guessed it! It was ", x, "!")
        return,
        if(previousGuess,
          if((x-chosenNumber) abs > (previousGuess-chosenNumber) abs,
            writeln("you are colder than last time"),
            writeln("you are getting warmer!")
            )
          )
        )
      previousGuess = x;
     )
