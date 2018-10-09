defmodule Agregator do
    

    def sum do
        1..1000
        |> Enum.filter(fn(x)-> 
            rem(x,3)==0 || rem(x,5)==0
        end)
        |> Enum.reduce(0, fn(x, acc)-> 
            acc + x
        end)
        |> IO.inspect
    end

    # def sum(to) when to>1 do
    def sum(to) do
        Range.new(1,to)
        |> Enum.filter(fn(x)-> 
            rem(x,3)==0 || rem(x,5)==0
        end)
        |> Enum.reduce(0, fn(x, acc)-> 
            acc + x
        end)
        |> IO.inspect
    end

    # def sum(to) do 
    #     IO.inspect "Параметр #{to} має бути більше нуля"
    # end


    def sum(from, to) when from < to do
        Range.new(from,to)
        |> Enum.filter(fn(x)-> 
            rem(x,3)==0 || rem(x,5)==0
        end)
        |> Enum.reduce(0, fn(x, acc)-> 
            acc + x
        end)
        |> IO.inspect
    end
    
    def sum(from, to) do
        IO.inspect "Число від (#{from}) має бути строго менше числа до (#{to})"
        {:error, "Wrong params"}
    end
end