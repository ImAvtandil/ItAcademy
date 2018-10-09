defmodule Countdown do
    
    def start(count) do
        Range.new(count, 0)
        |> Enum.each(fn(x)-> 
            IO.inspect "В вас залишилося #{x} секунд(а|и)"
            :timer.sleep(1000)
        end)
        IO.inspect "Час вийшов"
    end
end