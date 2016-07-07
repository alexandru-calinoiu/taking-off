defmodule SolarFlareRecorder do
	use GenServer

	def start_link do
		GenServer.start_link __MODULE__, []
	end

	def record_flare(pid, {:flare} = flare) do
		GenServer.call(pid, {:record, flare})
	end

	def handle_call({:record, flare}, _sender, flares) do
		flares = List.insert_at flares, -1, flare
		{:reply, :ok, flares}
	end
end