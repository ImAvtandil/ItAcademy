defmodule LessonsTest do
  use ExUnit.Case
  doctest Lessons

  test "greets the world" do
    assert Lessons.hello() == :world
  end
end
