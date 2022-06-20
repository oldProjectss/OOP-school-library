module PersonModule
  # is teacher or student
  def teacher_or_student(type)
    case type
    when '1'
      print 'Specialisation:  '
      gets.chomp
    when '2'
      loop do
        print 'Has parent permission [y/n]:'
        case gets.chomp
        when 'y'
          return true
        when 'n'
          return false
        else
          puts 'Invalid person parent permission. Please try again.'
        end
      end
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def create_person
    type = ''
    loop do
      puts 'Do you want to create a teacher (1) or a student (2)? [Input 1 or 2]:'
      type = gets.chomp
      break if %w[1 2].include?(type)
    end
    age = ''
    loop do
      print 'Age:  '
      age = gets.chomp
      break if age.to_i.positive? && age.to_i < 100 && age.to_i.to_s == age
    end
    print 'Name:  '
    name = gets.chomp
    specialisation, parent_permission = teacher_or_student(type)

    case type
    when '1'
      new_person = Teacher.new(specialisation, name, age)
    when '2'
      new_person = Student.new(age, name, parent_permission)
    end
    @people.push(new_person)
    puts
    # Puts message when person is created successfully
    puts "Person #{new_person.name} created successfully."
    puts
  end
end
