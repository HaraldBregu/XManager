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
public class com_ninespartans_xmanager_model_ProgramDataRealmProxy extends com.ninespartans.xmanager.model.ProgramData
    implements RealmObjectProxy, com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface {

    static final class ProgramDataColumnInfo extends ColumnInfo {
        long deviceLedPositionByteColKey;
        long animationByteColKey;
        long durationHoursByteColKey;
        long durationMinutesByteColKey;
        long durationSecondsByteColKey;

        ProgramDataColumnInfo(OsSchemaInfo schemaInfo) {
            super(5);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("ProgramData");
            this.deviceLedPositionByteColKey = addColumnDetails("deviceLedPositionByte", "deviceLedPositionByte", objectSchemaInfo);
            this.animationByteColKey = addColumnDetails("animationByte", "animationByte", objectSchemaInfo);
            this.durationHoursByteColKey = addColumnDetails("durationHoursByte", "durationHoursByte", objectSchemaInfo);
            this.durationMinutesByteColKey = addColumnDetails("durationMinutesByte", "durationMinutesByte", objectSchemaInfo);
            this.durationSecondsByteColKey = addColumnDetails("durationSecondsByte", "durationSecondsByte", objectSchemaInfo);
        }

        ProgramDataColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new ProgramDataColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final ProgramDataColumnInfo src = (ProgramDataColumnInfo) rawSrc;
            final ProgramDataColumnInfo dst = (ProgramDataColumnInfo) rawDst;
            dst.deviceLedPositionByteColKey = src.deviceLedPositionByteColKey;
            dst.animationByteColKey = src.animationByteColKey;
            dst.durationHoursByteColKey = src.durationHoursByteColKey;
            dst.durationMinutesByteColKey = src.durationMinutesByteColKey;
            dst.durationSecondsByteColKey = src.durationSecondsByteColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private ProgramDataColumnInfo columnInfo;
    private ProxyState<com.ninespartans.xmanager.model.ProgramData> proxyState;

    com_ninespartans_xmanager_model_ProgramDataRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (ProgramDataColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<com.ninespartans.xmanager.model.ProgramData>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$deviceLedPositionByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.deviceLedPositionByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.deviceLedPositionByteColKey);
    }

    @Override
    public void realmSet$deviceLedPositionByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.deviceLedPositionByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.deviceLedPositionByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.deviceLedPositionByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.deviceLedPositionByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$animationByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.animationByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.animationByteColKey);
    }

    @Override
    public void realmSet$animationByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.animationByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.animationByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.animationByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.animationByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationHoursByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationHoursByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationHoursByteColKey);
    }

    @Override
    public void realmSet$durationHoursByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationHoursByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationHoursByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationHoursByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationHoursByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationMinutesByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationMinutesByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationMinutesByteColKey);
    }

    @Override
    public void realmSet$durationMinutesByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationMinutesByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationMinutesByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationMinutesByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationMinutesByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationSecondsByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationSecondsByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationSecondsByteColKey);
    }

    @Override
    public void realmSet$durationSecondsByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationSecondsByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationSecondsByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationSecondsByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationSecondsByteColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "ProgramData", true, 5, 0);
        builder.addPersistedProperty(NO_ALIAS, "deviceLedPositionByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "animationByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationHoursByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationMinutesByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationSecondsByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static ProgramDataColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new ProgramDataColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "ProgramData";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "ProgramData";
    }

    @SuppressWarnings("cast")
    public static com.ninespartans.xmanager.model.ProgramData createOrUpdateEmbeddedUsingJsonObject(Realm realm, RealmModel parent, String parentProperty, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = Collections.<String> emptyList();
        com.ninespartans.xmanager.model.ProgramData obj = realm.createEmbeddedObject(com.ninespartans.xmanager.model.ProgramData.class, parent, parentProperty);

        final com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) obj;
        if (json.has("deviceLedPositionByte")) {
            if (json.isNull("deviceLedPositionByte")) {
                objProxy.realmSet$deviceLedPositionByte(null);
            } else {
                objProxy.realmSet$deviceLedPositionByte((byte) json.getInt("deviceLedPositionByte"));
            }
        }
        if (json.has("animationByte")) {
            if (json.isNull("animationByte")) {
                objProxy.realmSet$animationByte(null);
            } else {
                objProxy.realmSet$animationByte((byte) json.getInt("animationByte"));
            }
        }
        if (json.has("durationHoursByte")) {
            if (json.isNull("durationHoursByte")) {
                objProxy.realmSet$durationHoursByte(null);
            } else {
                objProxy.realmSet$durationHoursByte((byte) json.getInt("durationHoursByte"));
            }
        }
        if (json.has("durationMinutesByte")) {
            if (json.isNull("durationMinutesByte")) {
                objProxy.realmSet$durationMinutesByte(null);
            } else {
                objProxy.realmSet$durationMinutesByte((byte) json.getInt("durationMinutesByte"));
            }
        }
        if (json.has("durationSecondsByte")) {
            if (json.isNull("durationSecondsByte")) {
                objProxy.realmSet$durationSecondsByte(null);
            } else {
                objProxy.realmSet$durationSecondsByte((byte) json.getInt("durationSecondsByte"));
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static com.ninespartans.xmanager.model.ProgramData createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        final com.ninespartans.xmanager.model.ProgramData obj = new com.ninespartans.xmanager.model.ProgramData();
        final com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("deviceLedPositionByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$deviceLedPositionByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$deviceLedPositionByte(null);
                }
            } else if (name.equals("animationByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$animationByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$animationByte(null);
                }
            } else if (name.equals("durationHoursByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationHoursByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationHoursByte(null);
                }
            } else if (name.equals("durationMinutesByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationMinutesByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationMinutesByte(null);
                }
            } else if (name.equals("durationSecondsByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationSecondsByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationSecondsByte(null);
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        return obj;
    }

    static com_ninespartans_xmanager_model_ProgramDataRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class), false, Collections.<String>emptyList());
        io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy obj = new io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static com.ninespartans.xmanager.model.ProgramData copyOrUpdate(Realm realm, ProgramDataColumnInfo columnInfo, com.ninespartans.xmanager.model.ProgramData object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
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
            return (com.ninespartans.xmanager.model.ProgramData) cachedRealmObject;
        }

        return copy(realm, columnInfo, object, update, cache, flags);
    }

    public static com.ninespartans.xmanager.model.ProgramData copy(Realm realm, ProgramDataColumnInfo columnInfo, com.ninespartans.xmanager.model.ProgramData newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (com.ninespartans.xmanager.model.ProgramData) cachedRealmObject;
        }

        com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface unmanagedSource = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) newObject;

        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addInteger(columnInfo.deviceLedPositionByteColKey, unmanagedSource.realmGet$deviceLedPositionByte());
        builder.addInteger(columnInfo.animationByteColKey, unmanagedSource.realmGet$animationByte());
        builder.addInteger(columnInfo.durationHoursByteColKey, unmanagedSource.realmGet$durationHoursByte());
        builder.addInteger(columnInfo.durationMinutesByteColKey, unmanagedSource.realmGet$durationMinutesByte());
        builder.addInteger(columnInfo.durationSecondsByteColKey, unmanagedSource.realmGet$durationSecondsByte());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        return managedCopy;
    }

    public static long insert(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, com.ninespartans.xmanager.model.ProgramData object, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        long tableNativePtr = table.getNativePtr();
        ProgramDataColumnInfo columnInfo = (ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class);
        long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
        cache.put(object, objKey);
        Number realmGet$deviceLedPositionByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$deviceLedPositionByte();
        if (realmGet$deviceLedPositionByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
        }
        Number realmGet$animationByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$animationByte();
        if (realmGet$animationByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
        }
        Number realmGet$durationHoursByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationHoursByte();
        if (realmGet$durationHoursByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
        }
        Number realmGet$durationMinutesByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationMinutesByte();
        if (realmGet$durationMinutesByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
        }
        Number realmGet$durationSecondsByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationSecondsByte();
        if (realmGet$durationSecondsByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        long tableNativePtr = table.getNativePtr();
        ProgramDataColumnInfo columnInfo = (ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class);
        com.ninespartans.xmanager.model.ProgramData object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.ProgramData) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
            cache.put(object, objKey);
            Number realmGet$deviceLedPositionByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$deviceLedPositionByte();
            if (realmGet$deviceLedPositionByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
            }
            Number realmGet$animationByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$animationByte();
            if (realmGet$animationByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
            }
            Number realmGet$durationHoursByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationHoursByte();
            if (realmGet$durationHoursByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
            }
            Number realmGet$durationMinutesByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationMinutesByte();
            if (realmGet$durationMinutesByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
            }
            Number realmGet$durationSecondsByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationSecondsByte();
            if (realmGet$durationSecondsByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, com.ninespartans.xmanager.model.ProgramData object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        long tableNativePtr = table.getNativePtr();
        ProgramDataColumnInfo columnInfo = (ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class);
        long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
        cache.put(object, objKey);
        Number realmGet$deviceLedPositionByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$deviceLedPositionByte();
        if (realmGet$deviceLedPositionByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, false);
        }
        Number realmGet$animationByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$animationByte();
        if (realmGet$animationByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.animationByteColKey, objKey, false);
        }
        Number realmGet$durationHoursByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationHoursByte();
        if (realmGet$durationHoursByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, false);
        }
        Number realmGet$durationMinutesByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationMinutesByte();
        if (realmGet$durationMinutesByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, false);
        }
        Number realmGet$durationSecondsByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationSecondsByte();
        if (realmGet$durationSecondsByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        long tableNativePtr = table.getNativePtr();
        ProgramDataColumnInfo columnInfo = (ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class);
        com.ninespartans.xmanager.model.ProgramData object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.ProgramData) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
            cache.put(object, objKey);
            Number realmGet$deviceLedPositionByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$deviceLedPositionByte();
            if (realmGet$deviceLedPositionByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, false);
            }
            Number realmGet$animationByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$animationByte();
            if (realmGet$animationByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.animationByteColKey, objKey, false);
            }
            Number realmGet$durationHoursByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationHoursByte();
            if (realmGet$durationHoursByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, false);
            }
            Number realmGet$durationMinutesByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationMinutesByte();
            if (realmGet$durationMinutesByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, false);
            }
            Number realmGet$durationSecondsByte = ((com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) object).realmGet$durationSecondsByte();
            if (realmGet$durationSecondsByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, false);
            }
        }
    }

    public static com.ninespartans.xmanager.model.ProgramData createDetachedCopy(com.ninespartans.xmanager.model.ProgramData realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        com.ninespartans.xmanager.model.ProgramData unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new com.ninespartans.xmanager.model.ProgramData();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (com.ninespartans.xmanager.model.ProgramData) cachedObject.object;
            }
            unmanagedObject = (com.ninespartans.xmanager.model.ProgramData) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface unmanagedCopy = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) unmanagedObject;
        com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface realmSource = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$deviceLedPositionByte(realmSource.realmGet$deviceLedPositionByte());
        unmanagedCopy.realmSet$animationByte(realmSource.realmGet$animationByte());
        unmanagedCopy.realmSet$durationHoursByte(realmSource.realmGet$durationHoursByte());
        unmanagedCopy.realmSet$durationMinutesByte(realmSource.realmGet$durationMinutesByte());
        unmanagedCopy.realmSet$durationSecondsByte(realmSource.realmGet$durationSecondsByte());

        return unmanagedObject;
    }

    static com.ninespartans.xmanager.model.ProgramData update(Realm realm, ProgramDataColumnInfo columnInfo, com.ninespartans.xmanager.model.ProgramData realmObject, com.ninespartans.xmanager.model.ProgramData newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface realmObjectTarget = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) realmObject;
        com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface realmObjectSource = (com_ninespartans_xmanager_model_ProgramDataRealmProxyInterface) newObject;
        Table table = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addInteger(columnInfo.deviceLedPositionByteColKey, realmObjectSource.realmGet$deviceLedPositionByte());
        builder.addInteger(columnInfo.animationByteColKey, realmObjectSource.realmGet$animationByte());
        builder.addInteger(columnInfo.durationHoursByteColKey, realmObjectSource.realmGet$durationHoursByte());
        builder.addInteger(columnInfo.durationMinutesByteColKey, realmObjectSource.realmGet$durationMinutesByte());
        builder.addInteger(columnInfo.durationSecondsByteColKey, realmObjectSource.realmGet$durationSecondsByte());

        builder.updateExistingEmbeddedObject((RealmObjectProxy) realmObject);
        return realmObject;
    }

    public static void updateEmbeddedObject(Realm realm, com.ninespartans.xmanager.model.ProgramData unmanagedObject, com.ninespartans.xmanager.model.ProgramData managedObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        update(realm, (com_ninespartans_xmanager_model_ProgramDataRealmProxy.ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class), managedObject, unmanagedObject, cache, flags);
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("ProgramData = proxy[");
        stringBuilder.append("{deviceLedPositionByte:");
        stringBuilder.append(realmGet$deviceLedPositionByte() != null ? realmGet$deviceLedPositionByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{animationByte:");
        stringBuilder.append(realmGet$animationByte() != null ? realmGet$animationByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationHoursByte:");
        stringBuilder.append(realmGet$durationHoursByte() != null ? realmGet$durationHoursByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationMinutesByte:");
        stringBuilder.append(realmGet$durationMinutesByte() != null ? realmGet$durationMinutesByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationSecondsByte:");
        stringBuilder.append(realmGet$durationSecondsByte() != null ? realmGet$durationSecondsByte() : "null");
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
        com_ninespartans_xmanager_model_ProgramDataRealmProxy aProgramData = (com_ninespartans_xmanager_model_ProgramDataRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aProgramData.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aProgramData.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aProgramData.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}