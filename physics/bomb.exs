defmodule SolarFlareRecorder do
	use GenServer

	def start_link do
		Agent.start_link fn -> [] end
	end

	# public API
	def record_flare(pid, flare) do
		Agent.get_and_update pid, fn(flares) ->
			add_flare(flare)
			{flares, flares}
		end
	end

	defp add_flare(flare) do
		"""
		insert into solar_flares(classification, scale, stations, inserted_at, updated_at)
		values($1, $2, $3, now(), now()) RETURNING *;
		"""
		|> execute([flare.classification, flare.scale, flare.stations])
	end

	defp execute(sql, params) do
		{:ok, pid} = connect

		Postgrex.query!(pid, sql, params)
	end

	defp connect do
		Postgrex.start_link(hostname: "localhost", database: "physics", username: "postgres", password: "postgres")
	end
end

