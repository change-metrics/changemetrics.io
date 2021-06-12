---
title: Adding OAuth middleware to Servant application
---

Mauris in lorem nisl. Maecenas tempus facilisis ante, eget viverra nisl
tincidunt et. Donec turpis lectus, mattis ac malesuada a, accumsan eu libero.
Morbi condimentum, tortor et tincidunt ullamcorper, sem quam pretium nulla, id
convallis lectus libero nec turpis. Proin dapibus nisi id est sodales nec
ultrices tortor pellentesque.

```haskell
-- The monocle API type
type MonocleAPI =
       "fields" :> Vault :> ReqBody '[JSON] FieldsRequest :> Post '[JSON] FieldsResponse
  :<|> "search" :> Vault :> ReqBody '[JSON] SearchRequest :> Post '[JSON] SearchResponse

server :: ServerT MonocleAPI AppM
server = searchFields :<|> searchQuery

searchFields :: Vault -> FieldsRequest -> AppM FieldsResponse
searchFields vault _req = do
  let user = Auth.getAuthUserVault vault
  putTextLn $ "vaul user: " <> show user
  pure response
```

Vivamus vel nisi ac lacus sollicitudin vulputate
ac ut ligula. Nullam feugiat risus eget eros gravida in molestie sapien euismod.
Nunc sed hendrerit orci. Nulla mollis consequat lorem ac blandit. Ut et turpis
mauris. Nulla est odio, posuere id ullamcorper sit amet, tincidunt vel justo.
Curabitur placerat tincidunt varius. Nulla vulputate, ipsum eu consectetur
mollis, dui nibh aliquam neque, at ultricies leo ligula et arcu.
