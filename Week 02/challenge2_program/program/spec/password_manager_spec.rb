require_relative '../lib/password_manager'

RSpec.describe PasswordManager do
  describe '#add' do
    context '#when valid' do
      describe 'stores a password' do
        it 'so it can be read using password_for' do
          manager = PasswordManager.new
          manager.add('aceplay', '12345678!')
          expect(manager.password_for('aceplay')).to eq('12345678!')
        end

        it 'so the associated service appears in the list' do
          manager = PasswordManager.new
          manager.add('aceplay', '12345678!')
          expect(manager.services).to eq ['aceplay']
        end

      end

      it 'can store multiple passwords' do
        manager = PasswordManager.new
        manager.add('aceplay', '12345678!')
        manager.add('makersbnb', '12345678@')
        expect(manager.services).to eq ['aceplay', 'makersbnb']
      end
    end

    context 'when invalid' do
      describe 'because the password is too short' do
        it 'does not store the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567')
          expect(manager.services).to eq []
        end
      end

      describe 'because the password does not contain any special characters' do
        it 'does not store the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '12345678')
          expect(manager.services).to eq []
        end
      end
    end

    context 'when valid' do
      describe 'because the password contains eight characters including "!"' do
        it 'stores the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567!')
          expect(manager.services).to include('aceplay')
        end
      end

      describe 'because the password contains eight characters including "@"' do
        it 'stores the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567@')
          expect(manager.services).to include('aceplay')
        end
      end

      describe 'because the password contains eight characters including "$"' do
        it 'stores the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567$')
          expect(manager.services).to include('aceplay')
        end
      end

      describe 'because the password contains eight characters including "%"' do
        it 'stores the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567%')
          expect(manager.services).to include('aceplay')
        end
      end

      describe 'because the password contains eight characters including "&"' do
        it 'stores the password' do
          manager = PasswordManager.new
          manager.add('aceplay', '1234567&')
          expect(manager.services).to include('aceplay')
        end
      end
    end
  end
end
