# KG Express Client

[![Build Status](https://gramediadigital.visualstudio.com/Operations/_apis/build/status/kgx-client-Jenkins-CI)](https://gramediadigital.visualstudio.com/Operations/_build/latest?definitionId=74)

[KGX Official Website](https://kgx.co.id/)

KG Express is a logistics provider operating across Indonesia.  This is a simple client library that
simplifies the process of integrating the KGX REST API with your python-based application.

The base client does not require any particular framework for use, and has no dependencies other than
the venerable [requests](http://docs.python-requests.org/en/master/) library. 

As a convenience, this library also includes support for integration into [django-oscar](http://oscarcommerce.com).

## Quickstart

```python
from kgx import KGXClient, PickupType, CheckRateRequest

client = KGXClient(credentials=('my_user', 'my_p@ssw0rd'))

request = CheckRateRequest(
    origin_zipcode='10102',
    destination_zipcode='10101',
    weight=5,
    product_price=1000000,
    is_insurance=True,
    is_cod=False
)

estimates = client.check_rate(request)

nds_estimate = rate_estimate.services[PickupType.next_day_service])

print(nds_estimate.final_cost)
# >>> 70000
```

## Django-Oscar Settings

```python
# settings.py

KGX = {
    # required
    'CREDENTIALS': ('my_user', 'my_p@$$w0rd'),
    
    # optional -- default False
    'SANDBOX_MODE': False,
    
    # weight attribute code
    # this is necessary to calculate
    # shipping costs -- this field
    # **must** be a float and will
    # be assumed in kilograms
    'WEIGHT_ATTR_CODE': 'berat',
    
    # default weight to assume
    # if your products do not have a shipping
    # weight.  This will default to 1
    'DEFAULT_WEIGHT_KGS': 1,
    
    # ignore the shipping address from the partner
    # use the following address for all shipments
    'OVERRIDE_SHIPPING_ADDRESS': {
        '12345'
    }
}
```
