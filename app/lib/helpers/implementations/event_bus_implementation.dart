import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';

class ServiceBusImplementation implements ServiceBus {
  final List<ServiceBusSubscription> _subscriptions = [];

  @override
  Future<void> publish(data, String event) {
    _subscriptions.where((element) => element.event == event).forEach((element) {
      element.subscriber.onEventPublished(data, event);
    });
    return Future.value();
  }

  @override
  Future<void> unsubscribe(ServiceBusSubscriber subscriber, String event) {
    _subscriptions.removeWhere((element) => element.subscriber == subscriber && element.event == event);
    return Future.value();
  }

  @override
  Future<void> subscribe(ServiceBusSubscriber subscriber, String event) {
    _subscriptions.add(ServiceBusSubscription(subscriber, event));
    return Future.value();
  }
}
