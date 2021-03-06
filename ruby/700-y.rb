U = ->(f) { f.(f) }
Y = ->(z) {
  U.(
    ->(f) {
      recursion = ->(n) { f.(f).(n) }
      z.(recursion)
    }
  )
}

fact = Y.(
  ->(recursion) {
    ->(x) {
      if x == 1
        1
      else
        x * recursion.(x-1)
      end
    }
  }
)

puts fact.(8)

#Refactor - inline recursion and inline U
