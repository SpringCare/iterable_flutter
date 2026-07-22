# The Iterable Android SDK pulls in com.google.crypto.tink transitively, which
# references errorprone annotations that are compile-time only and absent at
# runtime. R8 treats the dangling references as errors, so suppress them.
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
