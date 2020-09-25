require Jim

IO.puts("hello, world")

Jim.i IO.gets("yes or no? ")

IO.puts(:stderr, "hello, stderr!")

{:ok, file} = File.open("io.hello", [:write])
IO.binwrite(file, "world")
File.close(file)
Jim.i File.read("io.hello")

Jim.i File.read("io.hello")
Jim.i File.read!("io.hello")
Jim.i File.read("unknown")
try do
  Jim.i File.read!("unknown")
rescue 
  e in File.Error -> Jim.i e
end

case File.read("io.hello") do
  {:ok, body} -> Jim.i body 
  {:error, reason} -> Jim.i reason
end

Jim.i Path.join("foo", "bar")
Jim.i Path.expand("./io.hello")
Jim.i Path.expand("io.hello")

file =  File.open!("io.hello", [:write])
Jim.i file
Jim.i File.close(file)
try do
  Jim.i IO.write(file, "is anybody out there?")
rescue
  e in ErlangError -> Jim.i e
end

pid = spawn fn ->
  receive do 
    msg -> 
      Jim.i msg 
      msg
  after
    100 -> :ok
  end
end
Jim.i pid
try do 
  Jim.i IO.write(pid, "hello")
rescue
  e in ErlangError -> Jim.i e
end

IO.puts('hello world')
IO.puts(['hello', ?\s, "world"])
