abstract class ServiceBus {
  Future<void> subscribe(ServiceBusSubscriber subscribe, String event);

  Future<void> unsubscribe(ServiceBusSubscriber subscribe, String event);

  Future<void> publish(Map<String, dynamic> data, String event);
}

abstract class ServiceBusSubscriber {
  Future<void> onEventPublished(Map<String, dynamic> data, String event);
}

class ServiceBusSubscription {
  final ServiceBusSubscriber subscriber;
  final String event;

  ServiceBusSubscription(this.subscriber, this.event);
}
