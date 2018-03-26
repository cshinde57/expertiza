describe VmQuestionResponseRow do
  before(:each) do
    @row = VmQuestionResponseRow.new('Question for testing average score', 1, 1, 5, 1)
  end

  describe "#average_score_for_row" do
    it 'returns correct average score for all not null scores' do
      score1 = VmQuestionResponseScoreCell.new(1, '#7DCEA0', 'Case_1_score_value1 = 1')
      score2 = VmQuestionResponseScoreCell.new(2, '#FDEDEC', 'Case_1_score_value2 = 2')
      score3 = VmQuestionResponseScoreCell.new(0, '#E6B0AA', 'Case_1_score_value3 =0')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(1)
    end

    it 'returns correct average score for all not null scores' do
      score1 = VmQuestionResponseScoreCell.new(5, '#D98880', 'Case_2_score_value1 = 5')
      score2 = VmQuestionResponseScoreCell.new(4, '#CD6155', 'Case_2_score_value2 = 4')
      score3 = VmQuestionResponseScoreCell.new(3, '#C0392B', 'Case_2_score_value3 = 3')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(4)
    end

    it 'returns correct average score for all not null zero scores' do
      score1 = VmQuestionResponseScoreCell.new(0, '#A93226', 'Case_3_score_value1 = 0')
      score2 = VmQuestionResponseScoreCell.new(0, '#7B241C', 'Case 3_score_value2 = 0')
      score3 = VmQuestionResponseScoreCell.new(0, '#641E16', 'Case_3_score_value3 = 0')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(0)
    end

    it 'returns correct average score for mixture of nil & not nil scores' do
      score1 = VmQuestionResponseScoreCell.new(2, '#FDEDEC', 'Case_4_score_value1 = 2')
      score2 = VmQuestionResponseScoreCell.new(4, '#FADBD8', 'Case_4_score_value2 = 4')
      score3 = VmQuestionResponseScoreCell.new(nil, '#F1948A', 'Case_4_score_value3 = nil')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(3)
    end

    it 'returns correct average score for mixture of nil & not nil scores' do
      score1 = VmQuestionResponseScoreCell.new(5, '#EC7063', 'Case_5_score_value1 = 5')
      score2 = VmQuestionResponseScoreCell.new(nil, '#E74C3C', 'Case_5_score_value2 = nil')
      score3 = VmQuestionResponseScoreCell.new(nil, '#CB4335', 'Case_5_score_value3 = nil')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(5)
    end

    it 'returns correct average score for mixture of nil, not nil and 0 scores' do
      score1 = VmQuestionResponseScoreCell.new(5, '#B03A2E', 'Case_6_score_value1 = 5')
      score2 = VmQuestionResponseScoreCell.new(0, '#943126', 'Case_6_score_value2 = 0')
      score3 = VmQuestionResponseScoreCell.new(nil, '#78281F', 'Case_6_score_value3 = nil')
      scores = [score1, score2, score3]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(2.5)
    end

    it 'returns correct average score for all nil scores' do
      score1 = VmQuestionResponseScoreCell.new(nil, '#F5EEF8', 'Case_7_score_value1 = nil')
      score2 = VmQuestionResponseScoreCell.new(nil, '#EBDEF0', 'Case_7_score_value2 = nil')
      scores = [score1, score2]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(nil)
    end

    it 'returns correct average score for mixture of not null and nil ' do
      score1 = VmQuestionResponseScoreCell.new(nil, '#D7BDE2', 'Case_8_score_value1 = nil')
      score2 = VmQuestionResponseScoreCell.new(nil, '#C39BD3', 'Case_8_score_value2 = nil')
      score3 = VmQuestionResponseScoreCell.new(0, '#AF7AC5', 'Case_8_score_value3 = 0')
      score4 = VmQuestionResponseScoreCell.new(nil, '#9B59B6', 'Case_8_score_value4 = nil')
      score5 = VmQuestionResponseScoreCell.new(nil, '#7D3C98', 'Case_8_score_value5 = nil')
      scores = [score1, score2, score3, score4, score5]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(0)
    end

    it 'returns correct average score for mixture of not null and nil ' do
      score1 = VmQuestionResponseScoreCell.new(0, '#EAF2F8', 'Case_9_score_value1 = 0')
      score2 = VmQuestionResponseScoreCell.new(5, '#D4E6F1', 'Case_9_score_value2 = 5')
      score3 = VmQuestionResponseScoreCell.new(0, '#5499C7', 'Case_9_score_value3 = 0')
      score4 = VmQuestionResponseScoreCell.new(4, '#2980B9', 'Case_9_score_value4 = 4')
      score5 = VmQuestionResponseScoreCell.new(nil, '#154360', 'Case_9_score_value5 = nil')
      scores = [score1, score2, score3, score4, score5]
      @row.instance_variable_set(:@score_row, scores)
      expect(@row.average_score_for_row).to eq(2.25)
    end
  end
end
