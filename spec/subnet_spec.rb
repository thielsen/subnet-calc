require 'subnet'

describe 'input_parse' do
  it 'normalise correct slash notation' do
    expect(input_parse('123.123.123.123/16')).to eq ["123", "123", "123", "123", "16"]
  end
  it 'normalise correct subnet notation' do
    expect(input_parse('123.123.123.123 255.255.0.0')).to eq ["123", "123", "123", "123", "16"]
  end
  it 'error on incorrect slash notation subnet mask' do
    expect(input_parse('123.123.123.123/33')).to eq nil
  end
  it 'error on incorrect subnet notation slash notation mask' do
    expect(input_parse('123.123.123.123 255.255.255.256')).to eq nil
  end
  it 'error on incorrect subnet' do
    expect(input_parse('123.123.123.256/16')).to eq nil
  end
  it 'error on nonsense' do
    expect(input_parse('nonsense')).to eq nil
  end
end

describe 'dotted_to_slash' do
  it 'incorrect mask' do
    expect(dotted_to_slash('255.128.255.0')).to eq nil
  end
  it 'slash7' do
    expect(dotted_to_slash('254.0.0.0')).to eq 7
  end
  it 'slash15' do
    expect(dotted_to_slash('255.254.0.0')).to eq 15
  end
  it 'slash23' do
    expect(dotted_to_slash('255.255.254.0')).to eq 23
  end
  it 'slash31' do
    expect(dotted_to_slash('255.255.255.254')).to eq 31
  end
end
