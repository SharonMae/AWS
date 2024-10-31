# Create our bucket

```sh
aws s3 mb s3://prefixes-fun-og-1309
```

# Create our folder 

```sh
aws s3api put-object --bucket="prefixes-fun-og-1309" --key="hello/"
```

# Create many folders 

```sh
aws s3api put-object --bucket="prefixes-fun-og-1309" --key="Lorem/ipsum/dolor/sit/amet//consectetur/adipiscing/elit./Ut/molestie/hendrerit/neque//scelerisque/eleifend/ipsum/vehicula/feugiat./Fusce/efficitur/finibus/nisl/eu/viverra./Vestibulum/in/dapibus/turpis//eget/hendrerit/sapien./Aenean/ac/lorem/fringilla//maximus/odio/imperdiet//consectetur/quam./Curabitur/eu/pulvinar/ligula./Duis/vehicula/ante/eu/mi/interdum//et/efficitur/mi/ornare./Vestibulum/eget/hendrerit/ligula./Curabitur/ornare/massa/id/bibendum/condimentum./Praesent/sed/neque/pretium//aliquam/ex/a//gravida/leo./Suspendisse/semper/massa/in/molestie/euismod./Sed/mi/dolor//vehicula/id/blandit/eu//auctor/ac/tellus./Donec/orci/velit//ornare/sit/amet/sapien/et//condimentum/efficitur/nibh./In/a/faucibus/lectus./Sed/sodales/interdum/blandit./Nulla/enim/turpis//elementum/fringilla/ornare/nec//commodo/non/nisl./Fusce/commodo/libero/vitae/odio/rutrum/fringilla./Aenean/vulputate/neque/sit/amet/velit/iaculis/faucibus./Maecenas/pretium/condimentum/lobortis./Sed/egestas/tellus/quam//eget/placerat/est/posuere/sed/molesti/"
```

# Try and break the 1024 limit

```sh
aws s3api put-object --bucket="prefixes-fun-og-1309" --key="Lorem/ipsum/dolor/sit/amet//consectetur/adipiscing/elit./Ut/molestie/hendrerit/neque//scelerisque/eleifend/ipsum/vehicula/feugiat./Fusce/efficitur/finibus/nisl/eu/viverra./Vestibulum/in/dapibus/turpis//eget/hendrerit/sapien./Aenean/ac/lorem/fringilla//maximus/odio/imperdiet//consectetur/quam./Curabitur/eu/pulvinar/ligula./Duis/vehicula/ante/eu/mi/interdum//et/efficitur/mi/ornare./Vestibulum/eget/hendrerit/ligula./Curabitur/ornare/massa/id/bibendum/condimentum./Praesent/sed/neque/pretium//aliquam/ex/a//gravida/leo./Suspendisse/semper/massa/in/molestie/euismod./Sed/mi/dolor//vehicula/id/blandit/eu//auctor/ac/tellus./Donec/orci/velit//ornare/sit/amet/sapien/et//condimentum/efficitur/nibh./In/a/faucibus/lectus./Sed/sodales/interdum/blandit./Nulla/enim/turpis//elementum/fringilla/ornare/nec//commodo/non/nisl./Fusce/commodo/libero/vitae/odio/rutrum/fringilla./Aenean/vulputate/neque/sit/amet/velit/iaculis/faucibus./Maecenas/pretium/condimentum/lobortis./Sed/egestas/tellus/quam//eget/placerat/est/posuere/sed/molesti/halloween/carnevale/ferragosto/hello.txt" --body hello.txt
```
