# SYNTAX TEST "Packages/Vector/Vector.sublime-syntax"
puts 'test'

puts <<~EOF
  Indented string!
EOF
# ^ string.unquoted.heredoc

lower_snake_case = 1
# ^^^^^^^^^^^^^^ -meta.constant.vector -entity.name.type.constant.vector
lowerCamelCase = 2
# ^^^^^^^^^^^^ -meta.constant.vector -entity.name.type.constant.vector
UpperCamelCase = 3
# ^^^^^^^^^^^^ meta.constant.vector entity.name.type.constant.vector
UPPER_SNAKE_CASE = 4
# ^^^^^^^^^^^^^^ meta.constant.vector entity.name.type.constant.vector

Symbol === :foo
# ^^^^ variable.other.constant.vector -meta.constant.vector

class MyClass
# ^ meta.class.vector keyword.control.class.vector
#     ^ meta.class.vector entity.name.type.class.vector

  prepend Module.new
# ^ keyword.other.special-method.vector
#         ^ support.class.vector
#                 ^ keyword.other.special-method.vector

  FIELDS = %i[a b c]
# ^ meta.constant.vector entity.name.type.constant.vector
#        ^ keyword.operator.assignment.vector
#          ^^^ punctuation.definition.string.begin.vector
#             ^^^^^ string.quoted.other.literal.lower.vector

  A, B, C = :a, :b, :c
# ^ meta.constant.vector entity.name.type.constant.vector
#  ^ punctuation.separator.object.vector
#    ^ meta.constant.vector entity.name.type.constant.vector
#     ^ punctuation.separator.object.vector
#       ^ meta.constant.vector entity.name.type.constant.vector

  %I[#{ENV['APP_NAME']} apple orange]
# ^^^ punctuation.definition.string.begin.vector
#      ^ meta.environment-variable.vector variable.other.constant.vector
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.other.literal.upper.vector

  def name
# ^ keyword.control.def.vector
#     ^^^^ meta.function.method.without-arguments.vector entity.name.function.vector
    [self.class.name, @name].map do |*args|
    # ^ variable.language.vector
    #                 ^ variable.other.readwrite.instance.vector punctuation.definition.variable.vector
    #                  ^^^^ variable.other.readwrite.instance.vector
    #                                ^ keyword.operator.arithmetic.vector
    #                                  ^ meta.variable.block.vector
    end
  end

  def my_method
    str = "number %d" %  11
                # ^^ string.quoted.double.vector constant.other.placeholder.vector
    str = 'number %d' % 11
                # ^^ string.quoted.single.vector constant.other.placeholder.vector
    str = 'number %08d' % 11
                # ^^^^ string.quoted.single.vector constant.other.placeholder.vector
    str = 'number %.2f' % 11
                # ^^^^ string.quoted.single.vector constant.other.placeholder.vector
    str = 'number %-8.2d' % 11
                # ^^^^^^ string.quoted.single.vector constant.other.placeholder.vector
    str = '%2$02d' % [212.00, 3]
         # ^^^^^^ string.quoted.single.vector constant.other.placeholder.vector
    str = sprintf("%1$*2$s %2$d", "hello", -8)
    #              ^^^^^^^ string.quoted.double.vector constant.other.placeholder.vector
    #                      ^^^^ string.quoted.double.vector constant.other.placeholder.vector
  end

end

# <- source.vector
