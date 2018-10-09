defmodule Factorial do
    

    def get(x) do
        Range.new(1, x)
        |> Enum.reduce(1, fn(x, acc)-> 
            acc * x
        end)
    end

    def get_recursive(x) do
        calc_factorial(x, 1)
    end

    defp calc_factorial(1, acc) do
        acc
    end
    defp calc_factorial(x, acc) do
        calc_factorial(x-1, acc*x)
    end
end