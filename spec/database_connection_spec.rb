require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'allows a connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'allows a query' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks;", [])

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
