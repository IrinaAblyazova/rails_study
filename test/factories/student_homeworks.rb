FactoryBot.define do
  factory :student_homework do
    student
    lesson
    raiting
    student_comment
    teacher_comment
    date_begin
    date_end
    link_homework

    trait :check do
      state { 'checking' }
    end

    trait :modify do
      state { 'doing' }
    end

    trait :adopted do
      state { 'accepted' }
    end
  end
end
