require_relative File.join(__dir__, '..', '..', '..', 'db', 'seeders', 'seeder')

class SeederTester

  extend Seeder


  def self.create_seed_with(info = {}, seed_num: 0)
    # whatever needs to be done to create a seed
    #  use :info and :seed_num if needed (can ignore them if not needed)
  end
end


class SeederWithoutCreateSeedMethod
  extend Seeder
end


RSpec.describe 'Seeder' do

  subject { SeederTester }

  describe 'seed' do

    describe 'create a given number of objects' do

      it 'no args = create default number of items' do

        expect(subject).to receive(:seed_num)
                               .with(Seeder::DEFAULT_NUM, instance_of(Hash))
                               .exactly(1).times
                               .and_call_original

        expect(subject).to receive(:create_seed_with)
                               .with(instance_of(Hash), hash_including(:seed_num))
                               .exactly(Seeder::DEFAULT_NUM).times
        subject.seed
      end

      it 'one arg = create that number of items' do
        num_times = 2
        expect(subject).to receive(:seed_num)
                               .exactly(1).times
                               .and_call_original

        expect(subject).to receive(:create_seed_with)
                               .with(instance_of(Hash), hash_including(:seed_num))
                               .exactly(num_times).times

        subject.seed(num_times)
      end


      describe 'two args = create that number of items, second arg must be a hash' do

        context 'second arg is a hash' do

          it "seedish(2, {this: 'that'})" do
            num_times = 2
            expect(subject).to receive(:seed_num)
                                   .with(num_times, hash_including(this: 'that'),)
                                   .exactly(1)
                                   .and_call_original
            expect(subject).to receive(:create_seed_with)
                                   .with(hash_including(this: 'that'), hash_including(:seed_num))
                                   .exactly(num_times).times

            subject.seed(num_times, { this: 'that' })
          end
        end

        it 'second arg is not a hash will raise an error' do
          expect { subject.seed(2, 'blorf') }.to raise_error ArgumentError
        end
      end

    end
  end


  it 'create_seed_with must be implemented' do
    expect { SeederWithoutCreateSeedMethod.create_seed_with }.to raise_error NoMethodError
  end

end
