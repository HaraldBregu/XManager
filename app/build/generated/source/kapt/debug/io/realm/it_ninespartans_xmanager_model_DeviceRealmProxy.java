package io.realm;


import android.annotation.TargetApi;
import android.os.Build;
import android.util.JsonReader;
import android.util.JsonToken;
import io.realm.ImportFlag;
import io.realm.ProxyUtils;
import io.realm.exceptions.RealmMigrationNeededException;
import io.realm.internal.ColumnInfo;
import io.realm.internal.NativeContext;
import io.realm.internal.OsList;
import io.realm.internal.OsMap;
import io.realm.internal.OsObject;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.OsSet;
import io.realm.internal.Property;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.Row;
import io.realm.internal.Table;
import io.realm.internal.android.JsonUtils;
import io.realm.internal.core.NativeRealmAny;
import io.realm.internal.objectstore.OsObjectBuilder;
import io.realm.log.RealmLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("all")
public class it_ninespartans_xmanager_model_DeviceRealmProxy extends it.ninespartans.xmanager.model.Device
    implements RealmObjectProxy, it_ninespartans_xmanager_model_DeviceRealmProxyInterface {

    static final class DeviceColumnInfo extends ColumnInfo {
        long idColKey;
        long nameColKey;
        long firmwareVersionColKey;
        long macColKey;
        long ble_macColKey;
        long wifi_macColKey;

        DeviceColumnInfo(OsSchemaInfo schemaInfo) {
            super(6);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("Device");
            this.idColKey = addColumnDetails("id", "id", objectSchemaInfo);
            this.nameColKey = addColumnDetails("name", "name", objectSchemaInfo);
            this.firmwareVersionColKey = addColumnDetails("firmwareVersion", "firmwareVersion", objectSchemaInfo);
            this.macColKey = addColumnDetails("mac", "mac", objectSchemaInfo);
            this.ble_macColKey = addColumnDetails("ble_mac", "ble_mac", objectSchemaInfo);
            this.wifi_macColKey = addColumnDetails("wifi_mac", "wifi_mac", objectSchemaInfo);
        }

        DeviceColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new DeviceColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final DeviceColumnInfo src = (DeviceColumnInfo) rawSrc;
            final DeviceColumnInfo dst = (DeviceColumnInfo) rawDst;
            dst.idColKey = src.idColKey;
            dst.nameColKey = src.nameColKey;
            dst.firmwareVersionColKey = src.firmwareVersionColKey;
            dst.macColKey = src.macColKey;
            dst.ble_macColKey = src.ble_macColKey;
            dst.wifi_macColKey = src.wifi_macColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private DeviceColumnInfo columnInfo;
    private ProxyState<it.ninespartans.xmanager.model.Device> proxyState;

    it_ninespartans_xmanager_model_DeviceRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (DeviceColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<it.ninespartans.xmanager.model.Device>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$id() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.idColKey);
    }

    @Override
    public void realmSet$id(String value) {
        if (proxyState.isUnderConstruction()) {
            // default value of the primary key is always ignored.
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        throw new io.realm.exceptions.RealmException("Primary key field 'id' cannot be changed after object was created.");
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$name() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.nameColKey);
    }

    @Override
    public void realmSet$name(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'name' to null.");
            }
            row.getTable().setString(columnInfo.nameColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'name' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.nameColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$firmwareVersion() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.firmwareVersionColKey);
    }

    @Override
    public void realmSet$firmwareVersion(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'firmwareVersion' to null.");
            }
            row.getTable().setString(columnInfo.firmwareVersionColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'firmwareVersion' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.firmwareVersionColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.macColKey);
    }

    @Override
    public void realmSet$mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'mac' to null.");
            }
            row.getTable().setString(columnInfo.macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.macColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$ble_mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.ble_macColKey);
    }

    @Override
    public void realmSet$ble_mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'ble_mac' to null.");
            }
            row.getTable().setString(columnInfo.ble_macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'ble_mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.ble_macColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$wifi_mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.wifi_macColKey);
    }

    @Override
    public void realmSet$wifi_mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'wifi_mac' to null.");
            }
            row.getTable().setString(columnInfo.wifi_macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'wifi_mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.wifi_macColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "Device", false, 6, 0);
        builder.addPersistedProperty(NO_ALIAS, "id", RealmFieldType.STRING, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "name", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "firmwareVersion", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "ble_mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "wifi_mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static DeviceColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new DeviceColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "Device";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "Device";
    }

    @SuppressWarnings("cast")
    public static it.ninespartans.xmanager.model.Device createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = Collections.<String> emptyList();
        it.ninespartans.xmanager.model.Device obj = null;
        if (update) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
            DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("id")) {
                objKey = table.findFirstString(pkColumnKey, json.getString("id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), false, Collections.<String> emptyList());
                    obj = new io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("id")) {
                if (json.isNull("id")) {
                    obj = (io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.Device.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.Device.class, json.getString("id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
            }
        }

        final it_ninespartans_xmanager_model_DeviceRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) obj;
        if (json.has("name")) {
            if (json.isNull("name")) {
                objProxy.realmSet$name(null);
            } else {
                objProxy.realmSet$name((String) json.getString("name"));
            }
        }
        if (json.has("firmwareVersion")) {
            if (json.isNull("firmwareVersion")) {
                objProxy.realmSet$firmwareVersion(null);
            } else {
                objProxy.realmSet$firmwareVersion((String) json.getString("firmwareVersion"));
            }
        }
        if (json.has("mac")) {
            if (json.isNull("mac")) {
                objProxy.realmSet$mac(null);
            } else {
                objProxy.realmSet$mac((String) json.getString("mac"));
            }
        }
        if (json.has("ble_mac")) {
            if (json.isNull("ble_mac")) {
                objProxy.realmSet$ble_mac(null);
            } else {
                objProxy.realmSet$ble_mac((String) json.getString("ble_mac"));
            }
        }
        if (json.has("wifi_mac")) {
            if (json.isNull("wifi_mac")) {
                objProxy.realmSet$wifi_mac(null);
            } else {
                objProxy.realmSet$wifi_mac((String) json.getString("wifi_mac"));
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static it.ninespartans.xmanager.model.Device createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final it.ninespartans.xmanager.model.Device obj = new it.ninespartans.xmanager.model.Device();
        final it_ninespartans_xmanager_model_DeviceRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("id")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$id((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$id(null);
                }
                jsonHasPrimaryKey = true;
            } else if (name.equals("name")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$name((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$name(null);
                }
            } else if (name.equals("firmwareVersion")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$firmwareVersion((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$firmwareVersion(null);
                }
            } else if (name.equals("mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$mac(null);
                }
            } else if (name.equals("ble_mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$ble_mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$ble_mac(null);
                }
            } else if (name.equals("wifi_mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$wifi_mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$wifi_mac(null);
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        if (!jsonHasPrimaryKey) {
            throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
        }
        return realm.copyToRealmOrUpdate(obj);
    }

    static it_ninespartans_xmanager_model_DeviceRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), false, Collections.<String>emptyList());
        io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy obj = new io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static it.ninespartans.xmanager.model.Device copyOrUpdate(Realm realm, DeviceColumnInfo columnInfo, it.ninespartans.xmanager.model.Device object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null) {
            final BaseRealm otherRealm = ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm();
            if (otherRealm.threadId != realm.threadId) {
                throw new IllegalArgumentException("Objects which belong to Realm instances in other threads cannot be copied into this Realm instance.");
            }
            if (otherRealm.getPath().equals(realm.getPath())) {
                return object;
            }
        }
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        RealmObjectProxy cachedRealmObject = cache.get(object);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Device) cachedRealmObject;
        }

        it.ninespartans.xmanager.model.Device realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = table.findFirstString(pkColumnKey, ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static it.ninespartans.xmanager.model.Device copy(Realm realm, DeviceColumnInfo columnInfo, it.ninespartans.xmanager.model.Device newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Device) cachedRealmObject;
        }

        it_ninespartans_xmanager_model_DeviceRealmProxyInterface unmanagedSource = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) newObject;

        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addString(columnInfo.idColKey, unmanagedSource.realmGet$id());
        builder.addString(columnInfo.nameColKey, unmanagedSource.realmGet$name());
        builder.addString(columnInfo.firmwareVersionColKey, unmanagedSource.realmGet$firmwareVersion());
        builder.addString(columnInfo.macColKey, unmanagedSource.realmGet$mac());
        builder.addString(columnInfo.ble_macColKey, unmanagedSource.realmGet$ble_mac());
        builder.addString(columnInfo.wifi_macColKey, unmanagedSource.realmGet$wifi_mac());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        return managedCopy;
    }

    public static long insert(Realm realm, it.ninespartans.xmanager.model.Device object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$name = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
        if (realmGet$name != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
        }
        String realmGet$firmwareVersion = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$firmwareVersion();
        if (realmGet$firmwareVersion != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, realmGet$firmwareVersion, false);
        }
        String realmGet$mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
        if (realmGet$mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
        }
        String realmGet$ble_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
        if (realmGet$ble_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
        }
        String realmGet$wifi_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
        if (realmGet$wifi_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.Device object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Device) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$name = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
            if (realmGet$name != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
            }
            String realmGet$firmwareVersion = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$firmwareVersion();
            if (realmGet$firmwareVersion != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, realmGet$firmwareVersion, false);
            }
            String realmGet$mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
            if (realmGet$mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
            }
            String realmGet$ble_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
            if (realmGet$ble_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
            }
            String realmGet$wifi_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
            if (realmGet$wifi_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, it.ninespartans.xmanager.model.Device object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$name = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
        if (realmGet$name != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.nameColKey, objKey, false);
        }
        String realmGet$firmwareVersion = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$firmwareVersion();
        if (realmGet$firmwareVersion != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, realmGet$firmwareVersion, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, false);
        }
        String realmGet$mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
        if (realmGet$mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.macColKey, objKey, false);
        }
        String realmGet$ble_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
        if (realmGet$ble_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.ble_macColKey, objKey, false);
        }
        String realmGet$wifi_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
        if (realmGet$wifi_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.wifi_macColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.Device object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Device) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$name = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
            if (realmGet$name != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.nameColKey, objKey, false);
            }
            String realmGet$firmwareVersion = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$firmwareVersion();
            if (realmGet$firmwareVersion != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, realmGet$firmwareVersion, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.firmwareVersionColKey, objKey, false);
            }
            String realmGet$mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
            if (realmGet$mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.macColKey, objKey, false);
            }
            String realmGet$ble_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
            if (realmGet$ble_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.ble_macColKey, objKey, false);
            }
            String realmGet$wifi_mac = ((it_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
            if (realmGet$wifi_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.wifi_macColKey, objKey, false);
            }
        }
    }

    public static it.ninespartans.xmanager.model.Device createDetachedCopy(it.ninespartans.xmanager.model.Device realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        it.ninespartans.xmanager.model.Device unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new it.ninespartans.xmanager.model.Device();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (it.ninespartans.xmanager.model.Device) cachedObject.object;
            }
            unmanagedObject = (it.ninespartans.xmanager.model.Device) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        it_ninespartans_xmanager_model_DeviceRealmProxyInterface unmanagedCopy = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) unmanagedObject;
        it_ninespartans_xmanager_model_DeviceRealmProxyInterface realmSource = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$id(realmSource.realmGet$id());
        unmanagedCopy.realmSet$name(realmSource.realmGet$name());
        unmanagedCopy.realmSet$firmwareVersion(realmSource.realmGet$firmwareVersion());
        unmanagedCopy.realmSet$mac(realmSource.realmGet$mac());
        unmanagedCopy.realmSet$ble_mac(realmSource.realmGet$ble_mac());
        unmanagedCopy.realmSet$wifi_mac(realmSource.realmGet$wifi_mac());

        return unmanagedObject;
    }

    static it.ninespartans.xmanager.model.Device update(Realm realm, DeviceColumnInfo columnInfo, it.ninespartans.xmanager.model.Device realmObject, it.ninespartans.xmanager.model.Device newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        it_ninespartans_xmanager_model_DeviceRealmProxyInterface realmObjectTarget = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) realmObject;
        it_ninespartans_xmanager_model_DeviceRealmProxyInterface realmObjectSource = (it_ninespartans_xmanager_model_DeviceRealmProxyInterface) newObject;
        Table table = realm.getTable(it.ninespartans.xmanager.model.Device.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addString(columnInfo.idColKey, realmObjectSource.realmGet$id());
        builder.addString(columnInfo.nameColKey, realmObjectSource.realmGet$name());
        builder.addString(columnInfo.firmwareVersionColKey, realmObjectSource.realmGet$firmwareVersion());
        builder.addString(columnInfo.macColKey, realmObjectSource.realmGet$mac());
        builder.addString(columnInfo.ble_macColKey, realmObjectSource.realmGet$ble_mac());
        builder.addString(columnInfo.wifi_macColKey, realmObjectSource.realmGet$wifi_mac());

        builder.updateExistingTopLevelObject();
        return realmObject;
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("Device = proxy[");
        stringBuilder.append("{id:");
        stringBuilder.append(realmGet$id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{name:");
        stringBuilder.append(realmGet$name());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{firmwareVersion:");
        stringBuilder.append(realmGet$firmwareVersion());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{mac:");
        stringBuilder.append(realmGet$mac());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{ble_mac:");
        stringBuilder.append(realmGet$ble_mac());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{wifi_mac:");
        stringBuilder.append(realmGet$wifi_mac());
        stringBuilder.append("}");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public ProxyState<?> realmGet$proxyState() {
        return proxyState;
    }

    @Override
    public int hashCode() {
        String realmName = proxyState.getRealm$realm().getPath();
        String tableName = proxyState.getRow$realm().getTable().getName();
        long objKey = proxyState.getRow$realm().getObjectKey();

        int result = 17;
        result = 31 * result + ((realmName != null) ? realmName.hashCode() : 0);
        result = 31 * result + ((tableName != null) ? tableName.hashCode() : 0);
        result = 31 * result + (int) (objKey ^ (objKey >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        it_ninespartans_xmanager_model_DeviceRealmProxy aDevice = (it_ninespartans_xmanager_model_DeviceRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aDevice.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aDevice.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aDevice.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}