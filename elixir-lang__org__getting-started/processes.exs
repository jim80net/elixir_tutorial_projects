require Jim

Jim.i pid = spawn fn -> 1+2 end
Jim.i Process.alive? pid
Jim.i Process.alive?(self())

Jim.i send self(), {:hello, "world"}

receive do
  {:hello, msg} -> Jim.i msg
  {:world, _msg} -> Jim.i "won't match"
end
receive do
  {:asdf, msg} -> Jim.i msg
after
  100 -> Jim.i "nothing after 0.1s"
end


parent = self()

spawn fn -> send(parent, {:hello, self()}) end

receive do
  {:hello, pid} -> Jim.p "Got hello from #{inspect pid}. It is #{if Process.alive?(pid), do: "alive ʕᵔᴥᵔʔ", else: "dead ಥ﹏ಥ"}."
end

Enum.each(1..3, fn _ -> send self(), :gerblerg end)

# Jim.i spawn fn -> raise "oops" end
# Jim.i Task.start fn -> raise "oops" end

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} -> 
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} -> 
        loop(Map.put(map, key, value))
    end
  end
end

{:ok, pid} = KV.start_link
 send pid, {:put, :hello, :world}
 send pid, {:get, :hello, self()}

 Process.register(pid, :kv)

 send :kv, {:get, :herro, self()}

 {:ok, pid} = Agent.start_link(fn -> %{} end)
 Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
 Agent.get(pid, fn map -> Map.get(map, :hello) end)
