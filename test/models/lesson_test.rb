require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test 'should create lesson' do
    lesson = build :lesson
    lesson.save

    created_lesson = Lesson.last
    assert created_lesson
  end

  test 'should not create lesson without homework' do
    lesson = build :lesson, homework: nil
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should not create lesson without discription' do
    lesson = build :lesson, description: nil
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should not create lesson with title length > 50' do
    lesson = build :lesson, title: 'Title' * 20
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should not create lesson with invalid state' do
    lesson = build :lesson, state: nil
    lesson.save

    created_lesson = Lesson.last
    assert_not created_lesson
  end

  test 'should del lesson' do
    lesson = create :lesson
    lesson.del
    assert_equal 'deleted', lesson.state
  end

  test 'should restore lesson' do
    lesson = create :lesson
    lesson.restore
    assert_equal 'active', lesson.state
  end
end
