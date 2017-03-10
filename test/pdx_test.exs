defmodule PdxTest do
  use ExUnit.Case
  use PropCheck
  doctest Pdx

  test "multiply numbers" do
    assert Pdx.multiply(2, 2) == 4
  end

  property "multiply(x, y) = x * y" do
    forall {x, y} in {integer(), integer()} do
      Pdx.multiply(x, y) == x * y
    end
  end

  property "pos * pos = pos" do
    forall {x, y} in {pos_integer(), pos_integer()} do
      Pdx.multiply(x, y) > 0
    end
  end

  property "neg * pos = neg" do
    forall {x, y} in {neg_integer(), pos_integer()} do
      Pdx.multiply(x, y) < 0
    end
  end

  property "integer * 1 = integer" do
    forall x in integer() do
      Pdx.multiply(x, 1) == x
    end
  end

  property "integer * 0 = 0" do
    forall x in integer() do
      Pdx.multiply(x, 0) == 0
    end
  end
 end
