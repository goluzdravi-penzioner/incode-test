# Project Documentation

This project contains Terraform resources for deploying applications.

## Getting Started

Make sure you have the following installed:

- Terraform (required)
- kubectl (not required for deploying but needed to interact with k8s cluster)

## Usage

To initialize the Terraform project cd into the terraform-code folder and run

```bash
terraform init
```
Before running terraform apply itr required to create a terraform.tfvars file in the following format and populate values

```
registry_user        = ""
registry_password    = ""
registry_server      = ""
image                = ""
image_tag            = ""
```

To apply the changes:

```bash
terraform validate
terraform plan
terraform apply
```

---

## Resouces created are:
- 2 node kind k8s cluster.
- Postgresl database deployed as a helm chart in the kind cluster.
  To access the database run the flowwing command in the terminal:
  ```
  kubectl -n sapf-test port-forward svc/sf-postgres-postgresql 5433:5432
  ```
  
  Postgress will be available on localhost:5433. Connect to it via psql or some gui tool like pg-admin.
  
  Postgres credentials are:
  username: testuser
  
  password can be extracted from a k8s secret:

  ```
  kubectl get secret postgres-auth -n sapf-test -o jsonpath="{.data.postgres-password}" | base64 --decode

  ```

- java app deployed as k8s deployment, with 2 replicas
  k8s service pointing to that deployment.
  This is solution intented for local development environments

  If the app is going to go to a proper SLDC I would go with a helm chart for packaging the app.
  
  Once packaged the chart can be pushed to a ghcr and referenced from there.   

### Verification

Business partners
Create a business partner
curl -X POST -H "Content-Type: application/json" http://localhost:8080/v1/businesspartners -d '{"firstName": "John","lastName": "Smith","email": "john.smith@example.com","role": "ADMIN"}'


Get all business partners
curl http://localhost:8080/v1/businesspartners

```bash
curl -s http://localhost:8080/v1/businesspartners | jq .
{
  "businessPartners": [
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440000",
      "firstName": "John",
      "lastName": "Doe",
      "email": "john.doe@example.com",
      "role": "ADMIN",
      "createdAt": "2024-01-01T10:00:00Z",
      "updatedAt": "2024-01-02T12:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440001",
      "firstName": "Jane",
      "lastName": "Smith",
      "email": "jane.smith@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-02-15T08:30:00Z",
      "updatedAt": "2024-02-15T09:45:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440002",
      "firstName": "Alice",
      "lastName": "Johnson",
      "email": "alice.johnson@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-03-10T14:20:00Z",
      "updatedAt": "2024-03-11T16:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440003",
      "firstName": "Bob",
      "lastName": "Brown",
      "email": "bob.brown@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-04-05T09:00:00Z",
      "updatedAt": "2024-04-05T11:30:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440004",
      "firstName": "Charlie",
      "lastName": "Davis",
      "email": "charlie.davis@example.com",
      "role": "ADMIN",
      "createdAt": "2024-05-20T07:15:00Z",
      "updatedAt": "2024-05-21T10:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440005",
      "firstName": "Emily",
      "lastName": "Wilson",
      "email": "emily.wilson@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-06-01T13:00:00Z",
      "updatedAt": "2024-06-01T15:30:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440006",
      "firstName": "Frank",
      "lastName": "Moore",
      "email": "frank.moore@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-07-10T10:10:00Z",
      "updatedAt": "2024-07-11T12:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440007",
      "firstName": "Grace",
      "lastName": "Taylor",
      "email": "grace.taylor@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-08-15T08:00:00Z",
      "updatedAt": "2024-08-15T09:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440008",
      "firstName": "Henry",
      "lastName": "Anderson",
      "email": "henry.anderson@example.com",
      "role": "ADMIN",
      "createdAt": "2024-09-01T06:30:00Z",
      "updatedAt": "2024-09-02T08:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440009",
      "firstName": "Ivy",
      "lastName": "Thomas",
      "email": "ivy.thomas@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-10-10T11:00:00Z",
      "updatedAt": "2024-10-10T13:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000a",
      "firstName": "Jack",
      "lastName": "Jackson",
      "email": "jack.jackson@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-11-05T09:45:00Z",
      "updatedAt": "2024-11-05T10:30:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000b",
      "firstName": "Karen",
      "lastName": "White",
      "email": "karen.white@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-12-01T14:00:00Z",
      "updatedAt": "2024-12-02T16:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000c",
      "firstName": "Leo",
      "lastName": "Harris",
      "email": "leo.harris@example.com",
      "role": "ADMIN",
      "createdAt": "2024-01-20T07:00:00Z",
      "updatedAt": "2024-01-21T09:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000d",
      "firstName": "Mia",
      "lastName": "Martin",
      "email": "mia.martin@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-02-10T10:00:00Z",
      "updatedAt": "2024-02-10T11:30:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000e",
      "firstName": "Noah",
      "lastName": "Garcia",
      "email": "noah.garcia@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-03-15T08:00:00Z",
      "updatedAt": "2024-03-15T09:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-44665544000f",
      "firstName": "Olivia",
      "lastName": "Martinez",
      "email": "olivia.martinez@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-04-01T12:00:00Z",
      "updatedAt": "2024-04-01T14:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440010",
      "firstName": "Paul",
      "lastName": "Robinson",
      "email": "paul.robinson@example.com",
      "role": "ADMIN",
      "createdAt": "2024-05-10T09:00:00Z",
      "updatedAt": "2024-05-11T10:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440011",
      "firstName": "Quinn",
      "lastName": "Clark",
      "email": "quinn.clark@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-06-15T07:30:00Z",
      "updatedAt": "2024-06-15T08:30:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440012",
      "firstName": "Rachel",
      "lastName": "Rodriguez",
      "email": "rachel.rodriguez@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-07-01T10:00:00Z",
      "updatedAt": "2024-07-01T11:00:00Z"
    },
    {
      "businessPartnerId": "550e8400-e29b-41d4-a716-446655440013",
      "firstName": "Steve",
      "lastName": "Lewis",
      "email": "steve.lewis@example.com",
      "role": "ACCOUNTANT",
      "createdAt": "2024-08-20T08:00:00Z",
      "updatedAt": "2024-08-20T09:30:00Z"
    },
    {
      "businessPartnerId": "3b53a110-1a7e-4efa-bbcd-3eb6b3640251",
      "firstName": "John",
      "lastName": "Smith",
      "email": "john.smith@example.com",
      "role": "ADMIN",
      "createdAt": "2025-04-27T14:15:48.774935Z",
      "updatedAt": "2025-04-27T14:15:48.774945Z"
    }
  ]
}

```

Get a business partner by id
curl http://localhost:8080/v1/businesspartners/550e8400-e29b-41d4-a716-446655440000

```bash
curl http://localhost:8080/v1/businesspartners/550e8400-e29b-41d4-a716-446655440000

{"businessPartnerId":"550e8400-e29b-41d4-a716-446655440000","firstName":"John","lastName":"Doe","email":"john.doe@example.com","role":"ADMIN","createdAt":"2024-01-01T10:00:00Z","updatedAt":"2024-01-02T12:00:00Z"}
```

Use case endpoints
Case 1 (endpoint with problems)
curl http://localhost:8080/v1/usecase/case1

```bash
~ curl http://localhost:8080/v1/usecase/case1
Config check passed
```

the issue was that the value of APP_SAMPLE_VALUE was not correct

Case 2 (endpoint with problems)
curl http://localhost:8080/v1/usecase/case2

For this case I found what the issue is but was not able to fix it without modifying the code:

```java
package com.fioneer.devopschallenge.devopsbackend.businesspartner.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class UsecaseService {
    private static final Logger log = LoggerFactory.getLogger(UsecaseService.class);
    private static final String CORRECT_VALUE = "dfg123qwer1288";
    @Value(value="${app.sample.value}")
    private String configParameter;

    public String case1() {
        if (CORRECT_VALUE.equals(this.configParameter)) {
            return "Config check passed.";
        }
        log.error("Validation error. The environment variable APP_SAMPLE_VALUE has the wrong value: expected {}, but found {}", (Object)CORRECT_VALUE, (Object)this.configParameter);
        throw new IllegalStateException("Something went wrong. Please identify the root cause and take appropriate action to resolve it.");
    }

    public String case2(int numberOfGigabytes) {
        int numberOfArrays = numberOfGigabytes * 1024;
        byte[][] memoryBlocks = new byte[numberOfArrays][];
        try {
            for (int i = 0; i < numberOfArrays; ++i) {
                memoryBlocks[i] = new byte[0x100000];
            }
        }
        catch (OutOfMemoryError e) {
            throw new IllegalStateException("Something went wrong. Please identify the root cause and take appropriate action to resolve it.");
        }
        return "Successfully allocated enough memory";
    }
}
```
and 
```java
package com.fioneer.devopschallenge.devopsbackend.businesspartner.controller;

import com.fioneer.devopschallenge.devopsbackend.businesspartner.service.UsecaseService;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value={"/v1/usecase"})
public class UsecaseController {
    private final UsecaseService usecaseService;

    public UsecaseController(UsecaseService usecaseService) {
        this.usecaseService = usecaseService;
    }

    @GetMapping(value={"/case1"})
    public ResponseEntity<String> case1() {
        try {
            String message = this.usecaseService.case1();
            return ResponseEntity.ok((Object)message);
        }
        catch (IllegalStateException ex) {
            return ResponseEntity.status((HttpStatusCode)HttpStatus.INTERNAL_SERVER_ERROR).body((Object)ex.getMessage());
        }
    }

    @GetMapping(value={"/case2"})
    public ResponseEntity<String> case2() {
        String result = this.usecaseService.case2(8);
        return ResponseEntity.ok((Object)result);
    }
}

```
Based on this calling the /case2 endpoint depends on the avaliable memory.

I was not able to allocate 8gm of ram only to that one process.
Solution would be to allocate either at least 8gb (in practice even more) of memory for pod, or change the code not to use that much ram, build a new image and deploy the fixed version in the kind cluster.