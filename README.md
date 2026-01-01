# ABAP Cloud - RAP Development Examples

Repositorio de ejemplos de desarrollo **ABAP RESTful Application Programming (RAP)** en SAP BTP ABAP Environment.

## 📋 Contenido

Este repositorio contiene dos aplicaciones Fiori Elements completas que demuestran patrones RAP:

### 1. Employee Management (ZSB_EMPL2)
Gestión de empleados con jerarquía de 3 niveles usando **Composition Pattern**.
```
Employee (Root)
  └── Project (Child)
        └── Skill (Grandchild)
```

**Características:**
- Composition pattern para navegación padre-hijo
- Collection Facets para agrupar secciones
- DataPoints en header del Object Page
- Calculated fields con CASE statements
- Metadata Extensions separadas

### 2. Plant Maintenance (ZSB_PM_MAINTENANCE)
Gestión de mantenimiento de equipos industriales.
```
Equipment (Root)
  └── Maintenance Order (Child)
        └── Operation (Grandchild)
```

**Características:**
- Criticality indicators con colores semáforo
- Status management (Operative, In Maintenance, Out of Service)
- Warranty status calculation
- Priority management (Emergency, Urgent, Normal, Low)

---

## 🏗️ Arquitectura RAP (5 Capas)
```
┌─────────────────────────────────────────┐
│  Service Binding (ZSB_*)                │  → Publicación OData
├─────────────────────────────────────────┤
│  Service Definition (ZSD_*)             │  → Exposición de entidades
├─────────────────────────────────────────┤
│  Metadata Extension (*.ddlx)            │  → Anotaciones UI
├─────────────────────────────────────────┤
│  Consumption View (ZC_*)                │  → Proyección + Compositions
├─────────────────────────────────────────┤
│  Interface View (ZI_*)                  │  → Modelo de datos + Associations
├─────────────────────────────────────────┤
│  Database Tables (ZDB_*)                │  → Persistencia
└─────────────────────────────────────────┘
```

---

## 📁 Estructura del Proyecto
```
src/
├── Database Tables
│   ├── zdb_gluces_empl2.tabl.xml    # Employee basic info
│   ├── zdb_gluces_cont2.tabl.xml    # Employee contact
│   ├── zdb_gluces_addr2.tabl.xml    # Employee address
│   ├── zdb_gluces_proj2.tabl.xml    # Employee projects
│   ├── zdb_gluces_skil2.tabl.xml    # Employee skills
│   ├── zdb_pm_equip.tabl.xml        # PM Equipment
│   ├── zdb_pm_locat.tabl.xml        # PM Location
│   ├── zdb_pm_order.tabl.xml        # PM Orders
│   └── zdb_pm_oper.tabl.xml         # PM Operations
│
├── Interface Views (ZI_*)
│   ├── zi_gluces_empl2.ddls.asddls
│   ├── zi_gluces_cont2.ddls.asddls
│   ├── zi_gluces_addr2.ddls.asddls
│   ├── zi_gluces_proj2.ddls.asddls
│   ├── zi_gluces_skill2.ddls.asddls
│   ├── zi_pm_equipment.ddls.asddls
│   ├── zi_pm_location.ddls.asddls
│   ├── zi_pm_order.ddls.asddls
│   └── zi_pm_operation.ddls.asddls
│
├── Consumption Views (ZC_*)
│   ├── zc_gluces_empl2.ddls.asddls   # Root entity
│   ├── zc_gluces_proj2.ddls.asddls   # Child entity
│   ├── zc_gluces_skill2.ddls.asddls  # Grandchild entity
│   ├── zc_pm_equipment.ddls.asddls
│   ├── zc_pm_order.ddls.asddls
│   └── zc_pm_operation.ddls.asddls
│
├── Metadata Extensions (*.ddlx)
│   ├── zc_empl2.ddlx.asddlxs
│   ├── zc_gluces_proj2.ddlx.asddlxs
│   ├── zc_skill2.ddlx.asddlxs
│   ├── zc_pm_equipment.ddlx.asddlxs
│   ├── zc_pm_order.ddlx.asddlxs
│   └── zc_pm_operation.ddlx.asddlxs
│
├── Service Definitions (ZSD_*)
│   ├── zsd_empl2.srvd.srvdsrv
│   └── zsd_pm_maintenance.srvd.srvdsrv
│
├── Service Bindings (ZSB_*)
│   ├── zsb_empl2.srvb.xml
│   └── zsb_pm_maintenance.srvb.xml
│
└── Data Generators
    ├── zcl_generator_empl_full.clas.abap
    └── zcl_pm_data_generator.clas.abap
```

---

## 🎯 Patrones RAP Implementados

### Composition Pattern
```abap
// Root Entity
define root view entity ZC_GLUCES_EMPL2
  composition [0..*] of ZC_GLUCES_PROJ2 as _Projects

// Child Entity
define view entity ZC_GLUCES_PROJ2
  association to parent ZC_GLUCES_EMPL2 as _Employee
  composition [0..*] of ZC_GLUCES_SKILL2 as _Skills
```

### Collection Facet (Agrupación de secciones)
```abap
@UI.facet: [
  { id: 'CommunicationInfo', type: #COLLECTION, label: 'Communication Info' },
  { type: #FIELDGROUP_REFERENCE, targetQualifier: 'Contact', parentId: 'CommunicationInfo' },
  { type: #FIELDGROUP_REFERENCE, targetQualifier: 'Address', parentId: 'CommunicationInfo' }
]
```

### DataPoints en Header
```abap
@UI.facet: [
  { purpose: #HEADER, type: #DATAPOINT_REFERENCE, targetQualifier: 'HeaderDesignation' }
]

@UI.dataPoint: { qualifier: 'HeaderDesignation', title: 'Designation' }
Designation;
```

### Criticality (Colores semáforo)
```abap
// En Interface View
case status
  when 'O' then 3   // Green
  when 'M' then 2   // Yellow
  when 'X' then 1   // Red
end as StatusCriticality

// En Metadata Extension
@UI.lineItem: [{ criticality: 'StatusCriticality', criticalityRepresentation: #WITH_ICON }]
```

### Calculated Fields
```abap
case ProjectType
  when 'IMP' then 'Implementation'
  when 'AMS' then 'Support AMS'
  else 'Other'
end as ProjectTypeText
```

---

## 🚀 Instalación

### Prerrequisitos
- SAP BTP ABAP Environment o S/4HANA Cloud
- Eclipse ADT con abapGit plugin

### Pasos
1. Clonar repositorio en ADT via abapGit
2. Activar objetos en orden:
   - Database Tables
   - Interface Views
   - Consumption Views (hijos primero, root al final)
   - Metadata Extensions
   - Service Definitions
3. Publicar Service Bindings
4. Ejecutar Data Generators para datos de prueba

### Orden de Activación (Employee)
```
1. ZC_GLUCES_SKILL2  (grandchild)
2. ZC_GLUCES_PROJ2   (child)
3. ZC_GLUCES_EMPL2   (root)
4. ZSD_EMPL2         (service definition)
5. Metadata Extensions (any order)
6. ZSB_EMPL2 → Publish
```

---

## 📊 Generar Datos de Prueba

Ejecutar las clases generadoras desde ADT (F9):
```abap
" Employee data (20 employees + contacts + addresses + projects + skills)
ZCL_GENERATOR_EMPL_FULL

" Plant Maintenance data (5 locations + 8 equipments + 7 orders + 17 operations)
ZCL_PM_DATA_GENERATOR
```

---

## 🖥️ Preview de Aplicaciones

Después de publicar los Service Bindings:

1. Abrir Service Binding en ADT
2. Click en la entidad root (Employee / Equipment)
3. Click en **Preview**

---

## 📚 Referencias

- [SAP RAP Documentation](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model)
- [Fiori Elements Annotations](https://ui5.sap.com/#/topic/f71a8fb5eab74e1f92293cddeb5c52db)
- [CDS Annotations Reference](https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP/cc0c305d2fab47bd808adcad3ca7ee9d)

---

## 👤 Autor

**Gabriel Luces**  
SAP Consultant | MM & PM & ABAP Development

---

## 📄 Licencia

Este proyecto es para fines educativos y de demostración.
