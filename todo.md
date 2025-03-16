- Fix following error
```bash
DEBUG 2025-03-16T14:53:39.627908296 Unauthorized: Error requesting VP: Failed to connect to /192.168.1.102:7082
DEBUG 2025-03-16T14:53:39.62799483 DSP: Service call failed: Unauthorized
SEVERE 2025-03-16T14:53:44.322579983 [ExecutionManager] org.eclipse.edc.spi.EdcException: {"@type":"dspace:CatalogError","dspace:code":"401","dspace:reason":"Unauthorized","@context":{"dcat":"http://www.w3.org/ns/dcat#","dct":"http://purl.org/dc/terms/","odrl":"http://www.w3.org/ns/odrl/2/","dspace":"https://w3id.org/dspace/v0.8/","@vocab":"https://w3id.org/edc/v0.0.1/ns/","edc":"https://w3id.org/edc/v0.0.1/ns/"}}
DEBUG 2025-03-16T14:53:44.328007835 [ExecutionManager] The following work item has errored out. Will re-queue after a delay of 19 seconds: [WorkItem{id='did:web:192.168.1.102%3A7083:provider', url='http://192.168.1.102:9082/api/dsp', protocolName='dataspace-protocol-http', errors=[org.eclipse.edc.spi.EdcException: {"@type":"dspace:CatalogError","dspace:code":"401","dspace:reason":"Unauthorized","@context":{"dcat":"http://www.w3.org/ns/dcat#","dct":"http://purl.org/dc/terms/","odrl":"http://www.w3.org/ns/odrl/2/","dspace":"https://w3id.org/dspace/v0.8/","@vocab":"https://w3id.org/edc/v0.0.1/ns/","edc":"https://w3id.org/edc/v0.0.1/ns/"}}]}]
SEVERE 2025-03-16T14:53:44.329988731 [ExecutionManager] Unexpected exception occurred during in crawler Crawler-432a3754-6274-42f3-a9b8-530835be1af9
java.util.concurrent.CompletionException: org.eclipse.edc.spi.EdcException: {"@type":"dspace:CatalogError","dspace:code":"401","dspace:reason":"Unauthorized","@context":{"dcat":"http://www.w3.org/ns/dcat#","dct":"http://purl.org/dc/terms/","odrl":"http://www.w3.org/ns/odrl/2/","dspace":"https://w3id.org/dspace/v0.8/","@vocab":"https://w3id.org/edc/v0.0.1/ns/","edc":"https://w3id.org/edc/v0.0.1/ns/"}}
	at java.base/java.util.concurrent.CompletableFuture.wrapInCompletionException(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.encodeRelay(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.completeRelay(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture$UniCompose.tryFire(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.postComplete(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.complete(Unknown Source)
	at dev.failsafe.spi.FailsafeFuture.completeResult(FailsafeFuture.java:99)
	at dev.failsafe.AsyncExecutionImpl.complete(AsyncExecutionImpl.java:153)
	at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.uniWhenCompleteStage(Unknown Source)
	at java.base/java.util.concurrent.CompletableFuture.whenComplete(Unknown Source)
	at dev.failsafe.AsyncExecutionImpl.executeAsync(AsyncExecutionImpl.java:143)
	at dev.failsafe.AsyncExecutionImpl.record(AsyncExecutionImpl.java:100)
	at dev.failsafe.AsyncExecutionImpl.recordResult(AsyncExecutionImpl.java:106)
	at dev.failsafe.okhttp.FailsafeCall$1.onResponse(FailsafeCall.java:145)
	at okhttp3.internal.connection.RealCall$AsyncCall.run(RealCall.kt:519)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)
	at java.base/java.lang.Thread.run(Unknown Source)
Caused by: org.eclipse.edc.spi.EdcException: {"@type":"dspace:CatalogError","dspace:code":"401","dspace:reason":"Unauthorized","@context":{"dcat":"http://www.w3.org/ns/dcat#","dct":"http://purl.org/dc/terms/","odrl":"http://www.w3.org/ns/odrl/2/","dspace":"https://w3id.org/dspace/v0.8/","@vocab":"https://w3id.org/edc/v0.0.1/ns/","edc":"https://w3id.org/edc/v0.0.1/ns/"}}
	at org.eclipse.edc.catalog.cache.query.PagingCatalogFetcher.readCatalogFrom(PagingCatalogFetcher.java:99)
	... 16 more
```