require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Sagittarius do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ sagittarius }).should.be.instance_of Command::Sagittarius
      end
    end
  end
end

