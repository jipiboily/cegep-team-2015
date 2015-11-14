require './course.rb'

describe Course do
  subject { course }
  let(:course) { Course.new }

  describe '#attendees' do
    it { expect(course).to respond_to(:attendees) }
    it { expect(course.attendees).to be_a Array }
  end

  describe '#initialize' do
    it { expect(course.attendees).to eq [] }
  end

  describe '#add_attendee' do
    it { expect(course).to respond_to(:add_attendee) }
    it { expect(course).to respond_to(:add_attendee).with(1).argument }
    it { expect(course.add_attendee('JP')).to eq ['JP'] }

    context 'with some attendees' do
      before do
        course.add_attendee 'Foo'
        course.add_attendee 'Bar'
      end

      it { expect { course.add_attendee 'JP' }.to change(course.attendees, :count).by(1) }
      it { expect(course.add_attendee 'JP').to eq ['Foo', 'Bar', 'JP'] }
    end
  end

  describe '#number_of_attendees' do
    it { expect(course).to respond_to(:number_of_attendees) }
    it { expect(course.number_of_attendees).to eq 0 }

    context 'with some attendees' do
      before do
        5.times do |i|
          course.add_attendee "Attendee ##{i}"
        end
      end

      it { expect(course.number_of_attendees).to eq 5 }
    end
  end
end
