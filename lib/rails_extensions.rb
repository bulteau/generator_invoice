class Float
  def round2(exp = 0)
   multiplier = 10 ** exp
   ((self * multiplier).round).to_f/multiplier.to_f
  end
end
