class RenameChallengeSubmission < ActiveRecord::Migration
  def up
		rename_table :challenge_submissions, :messaging_challenges
  end

  def down
		rename_table :messaging_challenges, :challenge_submissions
  end
end
