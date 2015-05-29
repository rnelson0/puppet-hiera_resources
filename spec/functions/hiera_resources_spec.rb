require 'spec_helper'

describe 'hiera_resources' do
  it { should run.with_params('test1').and_return(
    {"notify"=>
      {"title 1"=>
        {"message"=>"this is the first message stored in YAML"}
      }
    }
  ) }

  it { should run.with_params('test2').and_return(
    {"notify"=>
      {"title 2"=>
        {}
      }
    }
  ) }

  it { should run.with_params('test3').and_return(
    {"notify"=>
      {"title 3"=>
        {}
      }
    }
  ) }

  it { should run.with_params('test').and_raise_error(Puppet::ParseError) }
end
