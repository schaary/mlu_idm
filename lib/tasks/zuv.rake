# encoding: utf-8

namespace :zuv do
  desc 'synchronize k_abint into sos_grades'
  task :sync_grades => :environment do
    connect
    cursor = @pg.exec \
      "select abint, ltxt "    +
      "  from k_abint "        +
      " where (abint != '00' " +
      "   and abint != 'zz')"

    cursor.map do |record|
      SosGrade.create! \
        abint: record['abint'].strip,
        description: record['ltxt'].strip
      #ap record.symbolize_keys
    end
  end

  desc 'syncronize hissosexp into sos_students'
  task :sync_students => :environment do
    connect
    cursor = @pg.exec \
      "select mlumatrikel, sn, gn, mlugebdat, " +
      "  case "                                 +
      "    when mlugeschl = 'T' then 2 "        +
      "    when mlugeschl = 'F' then 1 "        +
      "    else 0 "                             +
      "  end as gender "                        +
      "  from hissosexp"

    cursor.map do |record|
      SosStudent.create! \
        matrikel: record['mlumatrikel'].to_i,
        firstname: record['gn'].strip,
        lastname: record['sn'].strip,
        date_of_birth: Date.parse(record['mlugebdat']),
        gender: record['gender'].to_i
    end
  end

  def connect
    @pg ||= PG::Connection.open \
      dbname: ENV['PG_ZUV_INSTANCE'],
      user: ENV['PG_ZUV_USER'],
      password: ENV['PG_ZUV_PASSWORD'],
      host: ENV['PG_ZUV_HOST'],
      port: ENV['PG_ZUV_PORT']
  end
end
