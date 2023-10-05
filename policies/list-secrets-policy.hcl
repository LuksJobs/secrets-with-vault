path "secret/metadata"
{
  capabilities = [ "list" ]
}

path "secret/metadata/*"
{
  capabilities = [ "list", "read" ]
}

# Allow a token to manage its own credentials
path "credentials/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to look up its own capabilities on a path
path "sys/capabilities-self" {
    capabilities = ["update"]
}

# Allow general purpose tools
path "sys/tools/hash" {
    capabilities = ["update"]
}
path "sys/tools/hash/*" {
    capabilities = ["update"]
}